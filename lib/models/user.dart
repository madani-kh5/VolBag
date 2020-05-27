class User{
  String uid;
  String firstName;
  String lastName;
  String email;
  String password;

  User({this.uid,this.firstName,this.lastName,this.email,this.password});

  Map<String, dynamic> toMap() {

    var map =  {
      'uid': uid,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
    };
    return map;
  }

   User.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        firstName = data['firstName'],
        lastName = data['lastName'],
        email = data['email'];
}