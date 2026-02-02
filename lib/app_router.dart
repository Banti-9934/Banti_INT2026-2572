import 'package:go_router/go_router.dart';
import 'screens/profile_screen.dart';
import 'screens/course_detail_screen.dart';
import 'screens/cart_screen.dart';

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
