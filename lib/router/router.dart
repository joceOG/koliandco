import 'package:get/get_navigation/src/routes/get_route.dart';
import '../main.dart';
import '../views/Home/home.dart';
import '../views/connexion/connexion.dart';
import '../views/detailsColis/detailsColis.dart';
import '../views/inscription/inscription.dart';
import '../views/kilos/kilos.dart';
import '../views/login.dart';
import '../views/rechercher/rechercher.dart';
import '../views/sign_up.dart';

abstract class Routes {
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const SIGNUP = '/signup';
  static const RECHERCHER = '/rechercher';
  static const DETAILSCOLIS = '/detailsColis';
  static const KILOS = '/kilos';
  static const CONNEXION = '/connexion';
  static const INSCRIPTION = '/inscription';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => Home(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => Login(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => Signup(),
    ),
    GetPage(
      name: Routes.RECHERCHER,
      page: () => Rechercher(),
    ),
    GetPage(
      name: Routes.DETAILSCOLIS,
      page: () => DetailsColis(),
    ),
    GetPage(
      name: Routes.KILOS,
      page: () => Kilos(),
    ),
    GetPage(
      name: Routes.CONNEXION,
      page: () => Connexion(),
    ),
    GetPage(
      name: Routes.INSCRIPTION,
      page: () => Inscription(),
    ),
  ];
}
