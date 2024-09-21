import 'package:get/get.dart';
import 'package:plate_perks/utils/static/routes.dart';
import 'package:plate_perks/views/main/main_page.dart';
import 'package:plate_perks/views/main/search_screen.dart';

List<GetPage<dynamic>> pages = [

  GetPage(name: AppRoutes.main, page: () => const MainPage()),
  GetPage(name: AppRoutes.search, page: () => const SearchScreen())



];
