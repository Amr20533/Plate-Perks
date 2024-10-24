import 'package:plate_perks/utils/static/app_assets.dart';
import 'package:plate_perks/utils/static/routes.dart';

class ProfileTilesData{
  final String icon;
  final String title;
  final String path;

  ProfileTilesData({
    required this.icon,
    required this.title,
    required this.path,
  });
  static List<ProfileTilesData> account = [
    ProfileTilesData(icon: AppAssets.cart, title: 'cart', path: AppRoutes.cart),
    ProfileTilesData(icon: AppAssets.favorite, title: 'favorite', path: AppRoutes.favorites),
    ProfileTilesData(icon: AppAssets.profile, title: 'account-settings', path: AppRoutes.accountSettings),
    ProfileTilesData(icon: AppAssets.info, title: 'help', path: AppRoutes.help),
    ProfileTilesData(icon: AppAssets.language, title: 'lang', path: AppRoutes.language),
    ProfileTilesData(icon: AppAssets.notification, title: 'notification', path: AppRoutes.notification),
  ];
  static List<ProfileTilesData> info = [
    ProfileTilesData(icon: AppAssets.shield, title: 'privacy-policy', path: AppRoutes.privacy),
    ProfileTilesData(icon: AppAssets.newspaper, title: 'news-services', path: AppRoutes.services),
    ProfileTilesData(icon: AppAssets.star, title: 'give-rating', path: AppRoutes.giveRating),
  ];
}