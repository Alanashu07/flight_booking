class User {
  final String? id;
  final String name;
  final int age;
  final String gender;
  final String dob;
  final String email;
  final String password;
  final String? image;
  final List<dynamic>? bookings;

  User({this.id, required this.name, required this.email, required this.password, this.image, this.bookings, required this.age, required this.dob, required this.gender});
}
