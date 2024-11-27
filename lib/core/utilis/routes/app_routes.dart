import 'package:checker/features/home/presentation/home.dart';
import 'package:checker/welcome.dart';

class AppRoutes {
  AppRoutes._();

  static String get initialRoute {
    return '/';
  }

  static final routes = {
    '/': (context) => const Welcomepage(),
    '/home': (context) =>  HomeScreen(),
  };
}
