import 'package:pulse_post/app/domain/dtos/user/user_token_dto.dart';

abstract interface class LocalStorageService {
  Future get(String key);
  Future put(String key, UserTokenDto value);
  Future delete(String key);
}
