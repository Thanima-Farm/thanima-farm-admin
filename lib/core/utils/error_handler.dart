class ErrorHandler {
  static String handleError(dynamic error) {
    if (error is Exception) {
      return "Something went wrong. Please try again.";
    }
    return "An unexpected error occurred.";
  }
}
