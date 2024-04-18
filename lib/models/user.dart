class User {
  final String? id;
  final String? firstname;
  final String? lastname;
  final String? phonenumber;
  final String? email;
  final String? password;
  final String? createdAt;

  User({
    this.id,
    this.firstname,
    this.lastname,
    this.phonenumber,
    this.email,
    this.password,
    this.createdAt,
  });

  // Method to convert UserData to Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'phonenumber': phonenumber,
      'email': email,
      'password': password,
      'created_at': createdAt,
    };
  }

  // Factory constructor to create UserData from Map
  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      firstname: map['firstname'],
      lastname: map['lastname'],
      phonenumber: map['phonenumber'],
      email: map['email'],
      password: map['password'],
      createdAt: map['created_at'],
    );
  }
}
