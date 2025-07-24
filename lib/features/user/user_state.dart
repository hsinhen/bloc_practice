class UserForm {
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? gender;

  const UserForm({this.name, this.email, this.phone, this.address, this.gender});

  UserForm copyWith({String? name, String? email, String? phone, String? address, String? gender}) {
    return UserForm(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      gender: gender ?? this.gender,
    );
  }
}
