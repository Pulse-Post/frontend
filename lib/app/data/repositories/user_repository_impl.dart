// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:pulse_post/app/data/exceptions/rest_exception.dart';
import 'package:pulse_post/app/domain/dtos/user/user_token_dto.dart';
import 'package:pulse_post/app/utils/apis/api_backend.dart';
import 'package:pulse_post/app/utils/constants/texts/text_constant.dart';
import 'package:result_dart/result_dart.dart';

import 'package:pulse_post/app/data/services/client/client_service.dart';
import 'package:pulse_post/app/domain/dtos/user/user_detail_dto.dart';
import 'package:pulse_post/app/domain/dtos/user/user_login_dto.dart';
import 'package:pulse_post/app/domain/dtos/user/user_register_dto.dart';
import 'package:pulse_post/app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final ClientService clientService;
  UserRepositoryImpl({required this.clientService});

  @override
  AsyncResult<UserDetailDto> detail() async {
    try {
      final Response response = await clientService.get(
        "${ApiBackend.user}/detail",
        requiresAuth: true,
      );

      final UserDetailDto resultProduct = UserDetailDto.fromMap(response.data);
      return Success(resultProduct);
    } on DioException catch (e) {
      return Failure(
        RestException(
          message: TextConstant.errorExecutingMessage,
          statusCode: e.hashCode,
        ),
      );
    }
  }

  @override
  AsyncResult<UserTokenDto> login(UserLoginDto data) async {
    try {
      final Response response = await clientService.post(
        "${ApiBackend.user}/login",
        data.toMap(),
      );
      final UserTokenDto resultLogin = UserTokenDto.fromMap(
        response.data['token'],
      );
      return Success(resultLogin);
    } on DioException catch (e) {
      return Failure(
        RestException(
          message: TextConstant.errorExecutingMessage,
          statusCode: e.response?.statusCode ?? 500,
        ),
      );
    }
  }

  @override
  AsyncResult<UserDetailDto> register(UserRegisterDto data) async {
    try {
      final Response response = await clientService.post(
        "${ApiBackend.user}/register",
        data.toMap(),
      );
      final UserDetailDto userRegister = UserDetailDto.fromMap(
        response.data,
      );
      return Success(userRegister);
    } on DioException catch (e) {
      return Failure(
        RestException(
          message: TextConstant.errorExecutingMessage,
          statusCode: e.response?.statusCode ?? 500,
        ),
      );
    }
  }
}
