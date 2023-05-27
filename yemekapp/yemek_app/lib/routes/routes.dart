import 'package:go_router/go_router.dart';
import 'package:yemek_app/screens/home_screen.dart';
import 'package:yemek_app/screens/order_screen.dart';

final routes = GoRouter(initialLocation: '/home', routes: [
  GoRoute(
    path: '/home',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/order',
    builder: (context, state) => const OrderScreen(),
  ),
]);
