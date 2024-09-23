import 'dart:collection';

class User{
  //singleton
  User._privateContructor();
  static final User _instance = User._privateContructor();
  factory User(){
    return _instance;
  }
  //

  String? id, username, email, password;

  User.fromJson(Map<dynamic, dynamic> e){
    id = e['ID'];
    username = e['Username'];
    email = e['Email'];
    password = e['Password'];
  }

  Map<dynamic, dynamic> toJson(){
    Map<dynamic,dynamic> data = {};
    data['ID'] = id;
    data['Username'] = username;
    data['Email'] = email;
    data['Password'] = password;
    return data;
  }

  setUser(String email, String username, String password){
    this.email = email;
    this.username = username;
    this.password = password;
  }
}

class ListUserModel{
  ListUserModel._privateContructor();
  static final _instance = ListUserModel._privateContructor();
  factory ListUserModel(){
    return _instance;
  }

  final List<User> _lst = [];
  UnmodifiableListView<User> get lstUser => UnmodifiableListView(_lst);

  bool add(User user){
    if(_lst.isEmpty){_lst.add(user);}

    if(!_lst.contains(user)){
      _lst.add(user);
    }

    if(_lst.isNotEmpty && _lst.length>lstUser.length){
      return true;
    }
    else{return false;}
  }
}