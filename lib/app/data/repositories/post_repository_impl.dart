// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dio/dio.dart';
import 'package:pulse_post/app/data/exceptions/rest_exception.dart';
import 'package:pulse_post/app/utils/apis/api_backend.dart';
import 'package:pulse_post/app/utils/constants/texts/text_constant.dart';
import 'package:result_dart/result_dart.dart';

import 'package:pulse_post/app/data/services/client/client_service.dart';
import 'package:pulse_post/app/domain/dtos/post/post_detail_dto.dart';
import 'package:pulse_post/app/domain/repositories/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final ClientService clientService;
  PostRepositoryImpl({required this.clientService});

  @override
  AsyncResult<List<PostDetailDto>> list() async {
    try {
      final Response response = await clientService.get(
        "${ApiBackend.post}/list",
        requiresAuth: true,
      );
      final List<dynamic> resultList = response.data['posts'];
      final List<PostDetailDto> dataList = resultList
          .map((item) => PostDetailDto.fromMap(item as Map<String, dynamic>))
          .toList();
      return Success(dataList);
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
