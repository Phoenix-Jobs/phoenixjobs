// @dart=2.9

class User {
  final String uid;
  final String token;
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String email;
  final String residueAddress;
  final String age;
  final String gender;
  final String status;

  // constructor
  User({
    this.uid = '',
    this.token = '',
    this.username = '',
    this.password = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.residueAddress = '',
    this.age = '',
    this.gender = '',
    this.status = '',
  });

  // copy constructor
  User.copy(from)
      : this(
          uid: from.uid,
          token: from.token,
          username: from.username,
          password: from.password,
          firstName: from.firstName,
          lastName: from.lastName,
          email: from.email,
          residueAddress: from.residueAddress,
          age: from.age,
          gender: from.gender,
          status: from.status,
        );

  // extract from json
  User.fromJson(Map<String, dynamic> json)
      : this(
          uid: json['uid'],
          token: json['token'],
          username: json['username'],
          password: json['password'],
          firstName: json['firstName'],
          lastName: json['lastName'],
          email: json['email'],
          residueAddress: json['residueAddress'],
          age: json['age'],
          gender: json['gender'],
          status: json['status'],
        );

  // encode to json
  Map<String, dynamic> toJson() => {
        'uid': uid,
        'token': token,
        'username': username,
        'password': password,
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'residueAddress': residueAddress,
        'age': age,
        'gender': gender,
        'status': status,
      };

  // retrieve an user object, pass it to copy constructor
  User copyWith({
    uid,
    token,
    username,
    password,
    firstName,
    lastName,
    email,
    residueAddress,
    age,
    gender,
    status,
  }) =>
      User(
        uid: uid ?? this.uid,
        token: token ?? this.token,
        username: username ?? this.username,
        password: password ?? this.password,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        residueAddress: residueAddress ?? this.residueAddress,
        age: age ?? this.age,
        gender: gender ?? this.gender,
        status: status ?? this.status,
      );
}
