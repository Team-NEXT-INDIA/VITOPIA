import '../screens/Intro/splash_screen.dart';
import '../screens/login/student_login.dart';

var applicationRoutes = {
  '/': (_) => const SplashScreen(),
  '/login': (_) => const StudentLogin(),
  '/studenthome': (_) => const StudentLogin(),
};
