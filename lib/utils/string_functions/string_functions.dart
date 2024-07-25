String truncateWithEllipsis(String text, {int maxLength = 50}) {
  return text.length <= maxLength ? text : '${text.substring(0, maxLength)}...';
}

bool isNullOrEmpty(String? value) {
  return value == null || value.isEmpty;
}