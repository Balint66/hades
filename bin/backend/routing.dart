import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class RoutingManager
{
  RoutingManager._();

  static void init(Router router)
  {
    router.post("/GetTrainings", login);
  }

  static Future<Response> login(Request request) async {
    final body = await request.readAsString();
    final obj = json.decode(body);
    return Response.ok(body);
  }

}
