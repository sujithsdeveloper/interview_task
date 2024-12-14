class Validations {
  static String? textvalidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This feild cannot be empty';
    }
    return null;
  }
}
