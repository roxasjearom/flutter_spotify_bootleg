String formatNumberToShortString(int value) {
  if (value >= 1000000) {
    double millions = value / 1000000.0;
    return '${millions.toStringAsFixed(1)}M';
  } else if (value >= 1000) {
    double thousands = value / 1000.0;
    return '${thousands.toStringAsFixed(1)}K';
  } else {
    return value.toString();
  }
}

String getYearFromDateString(String dateString) {
  try {
    DateTime date = DateTime.parse(dateString);
    int year = date.year;

    return year.toString();
  } catch (e) {
    return "-";
  }
}
