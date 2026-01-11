// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:pulse_post/app/data/services/messages/result_message_service.dart';
import 'package:pulse_post/app/domain/dtos/post/post_detail_dto.dart';
import 'package:pulse_post/app/domain/repositories/post_repository.dart';
import 'package:pulse_post/app/utils/constants/texts/text_constant.dart';

part 'post_view_model.g.dart';

class PostViewModel = PostViewModelBase with _$PostViewModel;

abstract class PostViewModelBase with Store {
  final PostRepository postRepository;
  final ResultMessageService resultMessageService;
  PostViewModelBase({
    required this.postRepository,
    required this.resultMessageService,
  });

  @observable
  bool isLoading = false;

  @observable
  bool serverError = false;

  @observable
  List<PostDetailDto>? postList;

  @action
  Future list() async {
    isLoading = true;
    final result = await postRepository.list();
    result.fold(
      (success) {
        serverError = false;
        postList = success;
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
}
