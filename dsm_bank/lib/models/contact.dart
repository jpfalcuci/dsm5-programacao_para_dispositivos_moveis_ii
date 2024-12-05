class Contact {
  final String name;
  final String address;
  final String phone;
  final String email;
  final String cpf;

  Contact(this.name, this.address, this.phone, this.email, this.cpf);

  @override
  String toString() {
    return 'Contact{name: $name, address: $address, phone: $phone, email: $email, cpf: $cpf}';
  }
}
