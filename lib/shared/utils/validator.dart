class Validator {
  String? validateEmail(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address.';
    } else {
      return null;
    }
  }

  static String? validateEmailS(String value) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid email address.';
    } else {
      return null;
    }
  }

  String? validateDropDefaultData(value) {
    if (value == null) {
      return 'Please select an item.';
    } else {
      return null;
    }
  }

  static String? validatePassword(String value) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return 'Password must be at least 6 characters.';
    } else {
      return null;
    }
  }

  String? validateName(String value) {
    if (value.length < 3) {
      return 'Username is too short.';
    } else {
      return null;
    }
  }

  String? validateText(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  static String? validateDate(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  static String? validateLocation(String value) {
    if (value.isEmpty) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  String? validatePhoneNumber(String value) {
    if (value.length != 11) {
      return 'Phone number is not valid.';
    } else {
      return null;
    }
  }
}
