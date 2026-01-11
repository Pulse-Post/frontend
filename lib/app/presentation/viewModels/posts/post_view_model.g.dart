// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostViewModel on PostViewModelBase, Store {
  late final _$isLoadingAtom = Atom(
    name: 'PostViewModelBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$serverErrorAtom = Atom(
    name: 'PostViewModelBase.serverError',
    context: context,
  );

  @override
  bool get serverError {
    _$serverErrorAtom.reportRead();
    return super.serverError;
  }

  @override
  set serverError(bool value) {
    _$serverErrorAtom.reportWrite(value, super.serverError, () {
      super.serverError = value;
    });
  }

  late final _$postListAtom = Atom(
    name: 'PostViewModelBase.postList',
    context: context,
  );

  @override
  List<PostDetailDto>? get postList {
    _$postListAtom.reportRead();
    return super.postList;
  }

  @override
  set postList(List<PostDetailDto>? value) {
    _$postListAtom.reportWrite(value, super.postList, () {
      super.postList = value;
    });
  }

  late final _$postListByFileTypeAtom = Atom(
    name: 'PostViewModelBase.postListByFileType',
    context: context,
  );

  @override
  List<PostDetailDto>? get postListByFileType {
    _$postListByFileTypeAtom.reportRead();
    return super.postListByFileType;
  }

  @override
  set postListByFileType(List<PostDetailDto>? value) {
    _$postListByFileTypeAtom.reportWrite(value, super.postListByFileType, () {
      super.postListByFileType = value;
    });
  }

  late final _$listAsyncAction = AsyncAction(
    'PostViewModelBase.list',
    context: context,
  );

  @override
  Future<dynamic> list() {
    return _$listAsyncAction.run(() => super.list());
  }

  late final _$listByFileTypeAsyncAction = AsyncAction(
    'PostViewModelBase.listByFileType',
    context: context,
  );

  @override
  Future<dynamic> listByFileType(String type) {
    return _$listByFileTypeAsyncAction.run(() => super.listByFileType(type));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
serverError: ${serverError},
postList: ${postList},
postListByFileType: ${postListByFileType}
    ''';
  }
}
