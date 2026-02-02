import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_project/models/course_model.dart';
import 'package:my_project/services/cart_service.dart';

class PriceSection extends StatelessWidget {
  final CourseModel course;

  const PriceSection({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "\$${course.price}",
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        ElevatedButton(
          onPressed: () {
            CartService().addToCart(course);
            context.go('/cart');
          },
          child: const Text("Enroll Now"),
        ),
      ],
    );
  }
}
