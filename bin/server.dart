
import 'package:logger/logger.dart';
import 'package:recharge/recharge.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'backend/managers/routing.dart';

final recharge = Recharge(path: '.');
final router = Router();
final logger = Logger(level: Level.verbose);
final manager = RoutingManager();
Future<void> main() async {


  recharge.init();

  manager.init(router);

  final _ = await serve(pipe, '127.0.0.4', 8080);

  logger.i('Server started');

}

Future<Response> pipe(Request req) async{

  logger.d('Request came to ${req.url} with method ${req.method}' );

  return router.call(req);
}
