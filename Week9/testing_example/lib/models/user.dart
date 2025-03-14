// User has an email and a name
// Will override the toString in the future
class User {
  const User({required this.email, required this.name});

  final String email;
  final String name;

  @override
  String toString() {
    return 'Name: $name, Email: $email';
  }
}
