void addNonNullToMap(Map<String, dynamic> reference, String key, dynamic value) {
  if (value == null) return;
  if (value == "null") return;
  if (value == "") return;
  reference[key] = value;
}
