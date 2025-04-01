extension StringExtension on String {
  String capitalizeString() {
    return isNotEmpty
        ? "${this[0].toUpperCase()}${substring(1).toLowerCase()}"
        : "";
  }

  String get capitalizeFirstOfEach =>
      split(" ").map((str) => str.capitalizeString()).join(" ");
}
