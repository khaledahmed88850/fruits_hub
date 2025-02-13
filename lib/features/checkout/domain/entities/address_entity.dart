class AddressEntity {
  String? address;
  String? email;
  String? city;
  String? addressDetails;
  String? phone;
  String? name;

  AddressEntity(
      {this.address,
      this.city,
      this.addressDetails,
      this.phone,
      this.name,
      this.email});

  toMap() {
    return {
      'address': address,
      'city': city,
      'addressDetails': addressDetails,
      'phone': phone,
      'name': name,
      'email': email
    };
  }
}
