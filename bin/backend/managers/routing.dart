import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../web/request/login.dart';
import '../../web/response/login.dart';
import '../../web/response/response_base.dart';
import 'trainings.dart';
import 'users.dart';

class RoutingManager
{

  RoutingManager()
  {
    TraininingsManager.INSTANCE.load();
    UsersManager.INSTANCE.load();
  }

  void init(Router router)
  {
    router.post("/GetTrainings", login);
  }

  Future<Response> login(Request request) async {
    final body = await request.readAsString();
    final req = json.decode(body) as Map<String, dynamic>;
    final obj = Login.fromJson(req);
    final base = ResponseBase.fromJson(req);
    final ret = UsersManager.INSTANCE.find(obj.UserLogin);
    if(ret.password != obj.Password) throw "Haha, proper error should be reported!";
    final resp = LoginR(base,
      traininngs: ret.trainings.map((e)=>e.toTraining()).toList(), );
    var js = <String, dynamic>{};
    resp.toJson(js);
    return Response.ok(json.encode(js), headers: <String, Object>{
      "Content-Type": "application/json; charset=utf-8",
      "Cache-Control": "private"
    },);
  }

}
