import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kafil/Models/Userdata.dart';
import 'package:kafil/consts/basUrl.dart';

class UserRepository {
  Future<void> registerUser(UserModel user) async {
    final String apiUrl = '${BaseUrl}user/register';

    try {
      final request = http.MultipartRequest('POST', Uri.parse(apiUrl))
        ..headers.addAll({
          'Accept': 'application/json',
          'Accept-Language': 'ar',
        })
        ..fields.addAll({
          'first_name': user.firstName,
          'last_name': user.lastName,
          'about': user.about,
          'tags': user.tags.map((tag) => tag.toString()).join(','),
          'favorite_social_media': user.favoriteSocialMedia.join(','),
          'salary': user.salary.toString(),
          'password': user.password,
          'email': user.email,
          'birth_date': user.birthDate,
         
          'type': user.type.toString(),
          'password_confirmation': user.passwordConfirmation,
        })
        ..files.add(
          await http.MultipartFile.fromPath('avatar', user.avatarPath),
        );

      final response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        print("success");
      } else {
        // Registration failed, handle the error
        print('Registration failed. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Registration failed');
      }
    } catch (error) {
      // Handle any network or unexpected errors
      print('Error during registration: $error');
      throw Exception('Error during registration');
    }
  }
}
