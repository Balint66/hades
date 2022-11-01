import 'dart:convert';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import '../../web/common/base_data.dart';
import '../../web/request/request.dart' as requests;
import '../../web/response/response.dart' as responses;
import '../data/user.dart';
import 'message_user_relation.dart';
import 'messages.dart';
import 'trainings.dart';
import 'users.dart';

class RoutingManager
{

  RoutingManager()
  {
    TraininingsManager.instance.load();
    UsersManager.instance.load();
    MessageManager.instance.load();
    MessageUserRelationManager.instance.load();
  }

  void init(Router router)
  {
    router
    ..post('/GetTrainings', _login)
    ..post('/GetMessages', _messages);
  }

  bool validateUser(User? user, String? password) {
    return user != null && user.password == password;
  }

  Future<Response> _login(Request request) async {
    final body = await request.readAsString();
    final req = json.decode(body) as Map<String, dynamic>;
    final obj = requests.Login.fromJson(req);
    final base = obj.findAs<Base>()!;
    final ret = UsersManager.instance.find(base.user);
    if(!validateUser(ret, base.password)) throw Exception('Haha, proper error should be reported!');
    final resp = responses.Login(base,
      traininngs: ret!.trainings.map((e)=>e.toTraining()).toList(), );
    return Response.ok(json.encode(resp.toJson()), headers: <String, Object>{
      'Content-Type': 'application/json; charset=utf-8',
      'Cache-Control': 'private'
    },);
  }

  Future<Response> _messages(Request request) async {
    final body = await request.readAsString();
    final req = json.decode(body) as Map<String, dynamic>;
    final obj = requests.Message.fromJson(req);
    final base = obj.findAs<Base>()!;
    final ret = UsersManager.instance.find(base.user)!;
    if(!validateUser(ret, base.password)) throw Exception('Haha, proper error should be reported!');
    final relation = MessageUserRelationManager.instance.find(ret)!;
    final resp = responses.Message(base, messageList: relation.messages.toList(),);
    return Response.ok(json.encode(resp.toJson()), headers: <String, Object>{
      'Content-Type': 'application/json; charset=utf-8',
      'Cache-Control': 'private'
    },);
  }

}
