class User {
  String firstName;
  String lastName;
  String phone;
  String email;
  double ratingvalue;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.ratingvalue,
  });
}

class SocialMedia {
  String facebookLink;
  String instagramLink;
  String viberLink;

  SocialMedia({
    required this.facebookLink,
    required this.instagramLink,
    required this.viberLink,
  });
}
