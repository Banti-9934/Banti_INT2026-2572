import 'package:flutter/material.dart';
import '../../../models/course_model.dart';

class CartItemTile extends StatelessWidget {
  final CourseModel course;
  final VoidCallback onDelete;

  const CartItemTile({
    super.key,
    required this.course,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Image.network(course.image, width: 60, fit: BoxFit.cover),
        title: Text(course.title),
        subtitle: Text("\$${course.price}"),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
