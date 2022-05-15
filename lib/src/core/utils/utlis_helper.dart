class UtilsHelper {
  static String parseBoolToString(val) {
    switch (val) {
      case null:
        return "upcoming";
      case true:
        return "success";
      case false:
        return "failure";
    }
    return "";
  }
}
