abstract class BaseItem {
  final String name;
  final String imageUrl;

  BaseItem({
    required this.name,
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BaseItem &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;
}
