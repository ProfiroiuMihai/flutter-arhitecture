
class InputFieldValidators {

  static const EMAIL_MIN_LENGTH = 3;
  static const NAME_MIN_LENGTH = 3;
  static const PASSWORD_MIN_LENGTH = 4;
  static const POST_TITLE_LENGTH = 2;
  static const POST_TEXT_LENGTH = 3;
 static  String pass;

  static String emailValidator(String email) {
    if (!email.contains('@') || !email.contains('.') ||
        email.length < EMAIL_MIN_LENGTH)
      return "Invalid email";
    else
      return null;
  }

  static String nameValidator(String name) {
    if (name.length < NAME_MIN_LENGTH)
      return "Invalid name";
    else
      return null;
  }

  static String socialSecurityNumberValidator(String socialNumber) {
    return null;
  }

  static String confirmSsnValidator(String socialNumberConfirmation) {
    return null;
  }

  static String birthdayValidator(String birthdayDate) {
    return null;
  }

  static String passwordValidator(String password) {
    pass=password;
    if (password.length < NAME_MIN_LENGTH)
      return "Invalid password";
    else
      return null;
  }

  static String confirmPasswordValidator(String password) {
    if (password!=pass)
      return "Password does not match";
    else
     return passwordValidator(password);
  }

  static String postTitleValidator(String text) {
    if (text.length < POST_TITLE_LENGTH)
      return "Title needs to be at least $POST_TITLE_LENGTH characters long";
    else
      return null;
  }

  static String postTextValidator(String text) {
    if (text.length < POST_TEXT_LENGTH)
      return "Text needs to be at least $POST_TEXT_LENGTH characters long";
    else
      return null;
  }

}