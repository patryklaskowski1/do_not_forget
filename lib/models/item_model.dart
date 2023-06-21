class ItemModel {
  ItemModel({
    required this.id,
    required this.title,
    required this.description,
    required this.releaseDate,
  });

  final String id;
  final String title;
  final String description;
  final DateTime releaseDate;

  String daysLeft() {
    return releaseDate.difference(DateTime.now()).inDays.toString();
  }
}
