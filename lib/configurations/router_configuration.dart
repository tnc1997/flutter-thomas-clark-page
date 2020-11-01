import 'package:thomas_clark/route_paths/route_path.dart';

class RouterConfiguration {
  final RoutePath path;
  final Object? state;

  RouterConfiguration({
    required this.path,
    this.state,
  });
}
