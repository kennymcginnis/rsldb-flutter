void addNonNullToMap(Map<String, dynamic> reference, String key, dynamic value) {
  if (value == null) return;
  if (value == "null") return;
  if (value == "") return;
  reference[key] = value;
}

int defaultRank(String rarity) {
  switch (rarity) {
    case "Legendary":
      return 50;
    case "Epic":
      return 40;
    case "Rare":
      return 30;
    case "Uncommon":
      return 20;
    case "Common":
      return 10;
    default:
      print("Unknown rarity! $rarity");
      return 10;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
