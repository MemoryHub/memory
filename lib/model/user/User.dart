class User {
  num id;
  String email;
  String password;

  User.fromJson(Map<String, dynamic> json)
      : email = json['email'],
        id = json['id'],
        password = json['password'];

  @override
  String toString() {
    return 'User{ id: $id, email: $email, password: $password}';
  }
}
