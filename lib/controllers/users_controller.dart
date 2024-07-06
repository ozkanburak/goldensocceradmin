import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firenase_crud2/models/users_model.dart';
import 'package:firenase_crud2/models/users_model2.dart';

class UsersController {
  final CollectionReference _users = FirebaseFirestore.instance.collection('maclar');

  Future addUsers(UserModel user) async {
    await _users.doc().set(user.addData());
  }

  Future updateUsers(UserModel user) async {
    await _users.doc(user.id).update(user.addData());
  }

  Future deleteUsers(UserModel user) async {
    await _users.doc(user.id).delete();
  }
}
class UsersController2 {
  final CollectionReference _users = FirebaseFirestore.instance.collection('premium');

  Future addUsers(UserModel user) async {
    await _users.doc().set(user.addData());
  }

  Future updateUsers(UserModel user) async {
    await _users.doc(user.id).update(user.addData());
  }

  Future deleteUsers(UserModel user) async {
    await _users.doc(user.id).delete();
  }
}
class UsersController3 {
  final CollectionReference _users = FirebaseFirestore.instance.collection('vip');

  Future addUsers(UserModel user) async {
    await _users.doc().set(user.addData());
  }

  Future updateUsers(UserModel user) async {
    await _users.doc(user.id).update(user.addData());
  }

  Future deleteUsers(UserModel user) async {
    await _users.doc(user.id).delete();
  }
}
class UsersController4 {
  final CollectionReference _users = FirebaseFirestore.instance.collection('high');

  Future addUsers(UserModel user) async {
    await _users.doc().set(user.addData());
  }

  Future updateUsers(UserModel user) async {
    await _users.doc(user.id).update(user.addData());
  }

  Future deleteUsers(UserModel user) async {
    await _users.doc(user.id).delete();
  }
}




