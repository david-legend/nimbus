import 'package:nimbus/presentation/pages/home/home_page.dart';
import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    // initial route is named "/"
    AutoRoute(page: HomePage, initial: true)
  ],
)
class $AppRouter {}
