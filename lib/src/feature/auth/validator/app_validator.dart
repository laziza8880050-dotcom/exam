class AppValidator {
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return ' Password kiriting';
    } else if (value.length <= 8) {
      return 'kamida 8 to bolishi kerak';
    }
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return ' email kiriting';
    } else if (RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
        ).hasMatch(value) ==
        false) {
      return 'email kiriting';
    }
  }

  static String? confirm(String? value) {
    if (value == null || value.isEmpty) {
      return 'Повторите пароль';
    }  if (value != value) {return 'Пароли не совпадают'; } return null;

  }
}
