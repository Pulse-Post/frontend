// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';
import 'package:pulse_post/app/data/exceptions/rest_exception.dart';

import 'package:pulse_post/app/data/services/local/local_storage_service.dart';
import 'package:pulse_post/app/data/services/messages/result_message_service.dart';
import 'package:pulse_post/app/domain/dtos/user/user_detail_dto.dart';
import 'package:pulse_post/app/domain/dtos/user/user_login_dto.dart';
import 'package:pulse_post/app/domain/dtos/user/user_register_dto.dart';
import 'package:pulse_post/app/domain/repositories/user_repository.dart';
import 'package:pulse_post/app/utils/constants/icons/icon_constant.dart';
import 'package:pulse_post/app/utils/constants/local/local_storage_constant.dart';
import 'package:pulse_post/app/utils/constants/texts/text_constant.dart';

part 'user_view_model.g.dart';

class UserViewModel = UserViewModelBase with _$UserViewModel;

abstract class UserViewModelBase with Store {
  final UserRepository userRepository;
  final LocalStorageService localStorageService;
  final ResultMessageService resultMessageService;
  UserViewModelBase({
    required this.userRepository,
    required this.localStorageService,
    required this.resultMessageService,
  });

  @observable
  String? token;

  @observable
  bool isLoading = false;

  @observable
  UserDetailDto? userDetailDto;

  @observable
  bool serverError = false;

  @action
  Future<void> login(UserLoginDto data) async {
    isLoading = true;
    final result = await userRepository.login(data);

    result.fold(
      (success) async {
        serverError = false;
        token = success.toString();
        await localStorageService.put(
          LocalStorageConstant.token,
          result.getOrThrow(),
        );

        resultMessageService.showMessageSuccess(
          TextConstant.sucessLoggingAccountTitle,
          TextConstant.sucessLoggingAccountMessage,
          IconConstant.success,
        );
      },
      (failure) async {
        resultMessageService.showMessageError(
          TextConstant.errorExecutingMessage,
        );
      },
    );
    isLoading = false;
  }

  @action
  Future register(UserRegisterDto data) async {
    isLoading = true;
    final result = await userRepository.register(data);

    result.fold(
      (success) {
        serverError = false;
        resultMessageService.showMessageSuccess(
          TextConstant.sucessRegisterAccountTitle,
          TextConstant.sucessRegisterPostMessage,
          IconConstant.success,
        );
      },
      (failure) {
        serverError = true;
        resultMessageService.showMessageError(
          TextConstant.errorExecutingMessage,
        );
      },
    );

    isLoading = false;
  }

  @action
  Future logout() async {
    isLoading = true;
    await localStorageService.delete(LocalStorageConstant.token);
    userDetailDto = null;
    token = null;
    isLoading = false;
  }

  @action
  Future details() async {
    isLoading = true;
    final result = await userRepository.detail();
    serverError = false;

    result.fold(
      (success) {
        serverError = false;
        userDetailDto = success;
      },
      (failure) async {
        if (failure is RestException &&
            (failure.statusCode == 500 || failure.statusCode == 403)) {
          serverError = true;
          await localStorageService.delete(LocalStorageConstant.token);
          userDetailDto = null;
        }
      },
    );

    isLoading = false;
  }

  @action
  Future<void> loadToken() async {
    token ??= await localStorageService.get(LocalStorageConstant.token);
  }
}
