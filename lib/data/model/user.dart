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
}