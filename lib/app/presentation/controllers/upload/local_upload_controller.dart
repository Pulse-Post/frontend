import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:mobx/mobx.dart';
part 'local_upload_controller.g.dart';

class LocalUploadController = LocalUploadControllerBase
    with _$LocalUploadController;

abstract class LocalUploadControllerBase with Store {
  @observable
  File? file;

  @observable
  bool isSizeValid = true;

  @observable
  bool isVideo = false;

  File? get selectedFile => file != null ? File(file!.path) : null;

  @action
  Future<void> uploadMedia() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg', 'mp4'],
      allowMultiple: false,
    );

    if (pickedFile == null) return;

    final result = pickedFile.files.first;
    final maxSizeFile = 10 * 1024 * 1024;
    if (result.size > maxSizeFile) {
      isSizeValid = false;
      return;
    } else {
      isSizeValid = true;
      final newFile = pickedFile.files.first.path.toString();
      final ext = newFile.split('.').last.toLowerCase();
      isVideo = ext == 'mp4' ? true : false;
      file = File(newFile);
    }
  }

  @action
  void removeMedia() {
    file = null;
    isSizeValid = true;
    isVideo = false;
  }
}
