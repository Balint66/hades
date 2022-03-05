
import 'package:logger/logger.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';

import 'backend/routing.dart';

final router = Router();
final logger = Logger();
Future<void> main() async {

  logger.i("Server started!");

  RoutingManager.init(router);

  final _ = await serve(pipe, "127.0.0.4", 8080);

}

Future<Response> pipe(Request req) async{

  logger.d("Request came to ${req.url} with method ${req.method}" );

  return router.call(req);
}
