import 'package:go_router/go_router.dart';
import 'package:placar_volei/src/routing/routes.dart';
import 'package:placar_volei/src/ui/home_view/home_view.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        builder: (context, state) => HomeView(),
      ),
    ],
  );
}
