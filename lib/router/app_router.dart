import 'package:go_router/go_router.dart';
import 'package:my_project/screens/profile/profile_screen.dart';
import 'package:my_project/screens/course_detail/course_detail_screen.dart';
import 'package:my_project/screens/cart/cart_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/profile',
  routes: [
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/course/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return CourseDetailScreen(courseId: id);
      },
    ),
    GoRoute(
      path: '/cart',
      builder: (context, state) => const CartScreen(),
    ),
  ],
);
