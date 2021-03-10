extension ValidateEmail on String {
  bool get validateEmail {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }

  bool get validatePassword {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(this);
  }

  bool get validateUserName {
    return RegExp(
            r'^[a-zA-Z]([._-](?![._-])|[a-zA-Z0-9]){2,20}([a-zA-Z0-9]|[_-])$')
        .hasMatch(this);
  }
}
