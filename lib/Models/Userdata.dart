

class UserModel {
  final String firstName;
  final String lastName;
  final String about;
  final List<int> tags;
  final List<String> favoriteSocialMedia;
  final int salary;
  final String password;
  final String email;
  final String birthDate;

  final int type;
  final String avatarPath;
  final String passwordConfirmation;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.about,
    required this.tags,
    required this.favoriteSocialMedia,
    required this.salary,
    required this.password,
    required this.email,
    required this.birthDate,
    
    required this.type,
    required this.avatarPath,
    required this.passwordConfirmation,
  });

Map<String, dynamic> toJson() {
  return {
    'first_name': firstName,
    'last_name': lastName,
    'about': about,
    'tags': tags.map((tag) => tag.toString()).toList(),
    'favorite_social_media': favoriteSocialMedia.toList(),
    'salary': salary.toString(),
    'password': password,
    'email': email,
    'birth_date': birthDate,

    'type': type.toString(),
    'avatar': avatarPath,
    'password_confirmation': passwordConfirmation,
  };
}
}
