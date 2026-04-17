class Movie {
  final String id;
  final String title;
  final String description;
  final String director;
  final String image;

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.director,
    required this.image,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      director: json['director'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "director": director,
      "image": image,
    };
  }
}