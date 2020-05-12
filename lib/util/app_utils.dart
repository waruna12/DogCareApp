class AppUtils {
  static String simpleTextFieldValidator(String value,
      {String name = "Field", int max = -1, int min = -1}) {
    try {
      if (value == null || value.isEmpty) {
        throw "$name is Required";
      }
      if (max > 0) {
        if (value.length > max) {
          throw "$name must have less than $max letters";
        }
      }
      if (min > 0) {
        if (value.length < min) {
          throw "$name must have greater than $min letters";
        }
      }
    } catch (err) {
      return err;
    }
    return null;
  }
}
