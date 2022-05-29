class Account {
  String email;
  String number;
  String address;

  Account({required this.email,required this.number,required this.address});

  Account.fromJson(Map <String, dynamic> json)
      :email = json["email"],
        number = json["number"],
        address = json["address"];
  Map<String, dynamic> toJson() => {
    "email":email,
    "number":number,
    "address":address,
  };

}