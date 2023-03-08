class UserModel{
  late String id;
  late String name;
  late String mail;
  late String tel;

  UserModel(this.id,this.name, this.mail, this.tel);

  UserModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    mail= map['mail'];
    tel= map['tel'];


  }
}


