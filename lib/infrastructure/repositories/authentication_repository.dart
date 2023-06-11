import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/exceptions/network_exceptions.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/dio_client.dart';
import '../../providers.dart';
import '../models/auth/user.dart';
import '../models/book/book_genre.dart';

final authenticationRepository = Provider<AuthenticationRepository>((ref) {
  final dio = ref.watch(dioClient);
  final preferences = ref.watch(sharedPreferences);

  return AuthenticationRepositoryImpl(dio, preferences);
});

abstract class AuthenticationRepository {
  Future<User> login({
    required String email,
    required String password,
  });
  Future<void> register({
    required String email,
    required String password,
    required String fullname,
    required int age,
    required String address,
    required List<BookGenre> interests,
  });
  Future<bool> checkEmail(String email);
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final DioClient _client;
  final SharedPreferences _preferences;

  const AuthenticationRepositoryImpl(this._client, this._preferences);

  @override
  Future<User> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.post(
        '/api/user/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      final user = User.fromJson(response.data);

      return user;
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  @override
  Future<void> register({
    required String email,
    required String password,
    required String fullname,
    required int age,
    required String address,
    required List<BookGenre> interests,
  }) async {
    try {
      // await supabase.auth.signUp(
      //   email: email,
      //   password: password,
      //   data: {
      //     'confirmation_sent_at': DateTime.now(),
      //   }
      // );

      await supabase.from('users').insert([
        {
          'email': email,
          'password': password,
          'fullname': fullname,
          'age': age,
          'address': address,
        }
      ]).execute();

      final user =
          await supabase.from('users').select('*').eq('email', email).execute();

      print(user.data);

      supabase
          .from('interests')
          .insert(interests.map((e) {
            return {
              'user_id': user.data![0]['id'],
              'genre_id': e.id,
            };
          }).toList())
          .execute();
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  @override
  Future<bool> checkEmail(String email) async {
    try {
      final response = await supabase
          .from('users')
          .select('email')
          .eq('email', email)
          .execute();

      if (response.data != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }
}
