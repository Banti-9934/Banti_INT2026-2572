import 'package:my_project/models/course_model.dart';

class CartService {
  CartService._private();
  static final CartService _instance = CartService._private();
  factory CartService() => _instance;

  final List<CourseModel> _items = [];

  List<CourseModel> get items => _items;

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.price);

  void addToCart(CourseModel course) {
    if (!_items.any((c) => c.id == course.id)) {
      _items.add(course);
    }
  }

  void removeFromCart(int id) {
    _items.removeWhere((c) => c.id == id);
  }
}
