import 'package:datademo2/model/account_model.dart';
import 'package:datademo2/model/user_model.dart';
import 'package:hive/hive.dart';

class HiveDB{

  var box = Hive.box("Feruz");

  void storeUser(User user) async{

    box.put("user", user.toJson());

  }

  User loadUser(){

    var user = User.fromJson(box.get("user"));
    return user;
  }
  void removeUser(){
    box.delete("user");
  }

  void storeAccount(Account account) async{

    box.put("account", account.toJson());

  }

  Account loadAccount(){

    var account = Account.fromJson(box.get("account"));
    return account;
  }
  void removeAccount(){
    box.delete("account");
  }

}