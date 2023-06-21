class BNDUploadFileViewModel {
  BNDUploadFileViewModel({
    this.path,
    this.name,
  });

  String? path;
  String? name;

  BNDUploadFileViewModel copyWith({
    String? path,
    String? name,
  }) =>
      BNDUploadFileViewModel(
        path: path ?? this.path,
        name: name ?? this.name,
      );
}
