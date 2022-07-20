class Recipe {
  final String? name;
  final String? images;
  final double? rating;
  final String? totalTime;


  /// even you add required keyword, it would still work perfectly.

  /// initialize
  Recipe({this.name, this.images, this.rating, this.totalTime});

  factory Recipe.fromJson(dynamic json) {
    /// it will return an instance of Recipe
    return Recipe(
      name: json["name"] as String,
      images: json["images"][0]["hostedLargeUrl"] as String,
      rating: json["rating"] as double,
      totalTime: json["totalTime"] as String,
    );
  }

  /// we are creating another function that will take a list of data which will be converted to list of recipes
  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      /// this part comes from factory
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating, totaltime: $totalTime}';
  }
}
