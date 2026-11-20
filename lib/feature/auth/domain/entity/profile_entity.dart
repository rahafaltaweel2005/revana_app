class ProfileEntity {
  final String firstName;
  final String lastName;
  final String email;
  final DateTime createdAt;
  final String id;
  final String role;

  ProfileEntity({
    required this.firstName,
    required this.role,
    required this.lastName,
    required this.email,
    required this.createdAt,
    required this.id,
  });
}
