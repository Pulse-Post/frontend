import 'package:pulse_post/app/domain/dtos/post/post_detail_dto.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class PostRepository {
  AsyncResult<List<PostDetailDto>> list();
  AsyncResult<List<PostDetailDto>> listByFileType(String type);
}
