class CourseModel {
  final int id;
  final String title;
  final String image;
  final double rating;
  final double price;
  final String? students;
  final String? author;
  final bool isBestSeller;

  final String? description;
  final String? instructorName;
  final String? instructorRole;
  final String? instructorImage;
  final String? duration;
  final String? level;
  final int? reviews;
  final Map<String, dynamic>? ratingBreakdown;

  CourseModel({
    required this.id,
    required this.title,
    required this.image,
    required this.rating,
    required this.price,
    this.students,
    this.author,
    this.isBestSeller = false,
    this.description,
    this.instructorName,
    this.instructorRole,
    this.instructorImage,
    this.duration,
    this.level,
    this.reviews,
    this.ratingBreakdown,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      rating: (json['rating'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      students: json['students'],
      author: json['author'],
      isBestSeller: json['isBestSeller'] ?? false,
      description: json['description'],
      instructorName: json['instructorName'],
      instructorRole: json['instructorRole'],
      instructorImage: json['instructorImage'],
      duration: json['duration'],
      level: json['level'],
      reviews: json['reviews'],
      ratingBreakdown: json['ratingBreakdown'],
    );
  }
}
