extension StringEmptyCheck on String? {
  bool get isStringEmpty => this == null || this!.trim().isEmpty;
}
