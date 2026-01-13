// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:pulse_post/app/domain/dtos/post/post_detail_dto.dart';
import 'package:pulse_post/app/domain/dtos/post/post_register_dto.dart';
import 'package:pulse_post/app/domain/dtos/post/post_update_dto.dart';

import 'package:pulse_post/app/presentation/viewModels/posts/post_view_model.dart';

part 'post_controller.g.dart';

class PostController = PostControllerBase with _$PostController;

abstract class PostControllerBase with Store {
  final PostViewModel postViewModel;
  PostControllerBase({required this.postViewModel});

  @computed
  bool get isLoading => postViewModel.isLoading;

  @computed
  bool get isServerError => postViewModel.serverError;

  @computed
  List<PostDetailDto>? get postList => postViewModel.postList;

  @computed
  List<PostDetailDto>? get postListByFileType =>
      postViewModel.postListByFileType;

  Future<void> list() async {
    await postViewModel.list();
  }

  Future<void> listByFileType(String type) async {
    await postViewModel.listByFileType(type);
  }

  Future<void> register(PostRegisterDto data, File? file) async {
    await postViewModel.register(data, file);
  }

  Future<void> update(String id, PostUpdateDto data, File? file) async {
    await postViewModel.update(id, data, file);
  }
}
