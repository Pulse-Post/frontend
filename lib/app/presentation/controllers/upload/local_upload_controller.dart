import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
part 'local_upload_controller.g.dart';

class LocalUploadController = LocalUploadControllerBase
    with _$LocalUploadController;

abstract class LocalUploadControllerBase with Store {
  @observable
  XFile? imageFile;

  File? get selectedImageFile =>
      imageFile != null ? File(imageFile!.path) : null;

  @action
  Future<void> uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = pickedFile;
    }
  }

  @action
  void removeImage() {
    imageFile = null;
  }
}
