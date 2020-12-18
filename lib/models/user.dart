class Users {
  Users({
    this.lastname,
    this.firstname,
    this.email,
    this.phonenumber,
    this.userid,
    this.password,
  });

  Users.fromData(Map<String, dynamic> data)
      : firstname = data["firstname"],
        lastname = data["lastname"],
        phonenumber = data["phonenumber"],
        userid = data["userid"],
        email = data["email"];

  Map<String, dynamic> toJson() {
    return {
      "firstname": firstname,
      "lastname": lastname,
      "email": email,
      "phonenumber": phonenumber,
      "userid": userid,
    };
  }

  String firstname, lastname, email, phonenumber, userid, password;
}
