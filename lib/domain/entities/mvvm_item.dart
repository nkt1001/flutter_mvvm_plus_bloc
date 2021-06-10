class MvvmItem {
  final String title;

  MvvmItem(this.title);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MvvmItem &&
          runtimeType == other.runtimeType &&
          title == other.title;

  @override
  int get hashCode => title.hashCode;
}