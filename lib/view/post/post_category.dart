class PostCategory {
  late String category_id, category_name;

  PostCategory(
      {
        required this.category_id,
        required this.category_name});

  PostCategory.fromJson(Map<String, dynamic> map) {
    category_id = map['category_id'];
    category_name = map['category_name'];

  }
}