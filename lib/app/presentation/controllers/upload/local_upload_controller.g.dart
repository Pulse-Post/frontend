// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_upload_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocalUploadController on LocalUploadControllerBase, Store {
  late final _$imageFileAtom = Atom(
    name: 'LocalUploadControllerBase.imageFile',
    context: context,
  );

  @override
  XFile? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(XFile? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$uploadImageAsyncAction = AsyncAction(
    'LocalUploadControllerBase.uploadImage',
    context: context,
  );

  @override
  Future<void> uploadImage() {
    return _$uploadImageAsyncAction.run(() => super.uploadImage());
  }

  late final _$LocalUploadControllerBaseActionController = ActionController(
    name: 'LocalUploadControllerBase',
    context: context,
  );

  @override
  void removeImage() {
    final _$actionInfo = _$LocalUploadControllerBaseActionController
        .startAction(name: 'LocalUploadControllerBase.removeImage');
    try {
      return super.removeImage();
    } finally {
      _$LocalUploadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
imageFile: ${imageFile}
    ''';
  }
}
