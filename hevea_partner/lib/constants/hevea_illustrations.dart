import 'package:hevea_core/widgets/images/svg_image.dart';

class HeveaIllustrations {
  static const mapEmptyState = SvgImage(imagePath: _Paths.mapEmptyState);
  static const noTasksEmptyState = SvgImage(imagePath: _Paths.noTasksEmptyState);
  static const paymentError = SvgImage(imagePath: _Paths.paymentError);
  static const comingSoon = SvgImage(imagePath: _Paths.comingSoon);

  static const blueGirl = SvgImage(
    imagePath: _Paths.blueGirl,
    isSi: true,
  );
  static const redGirl = SvgImage(
    imagePath: _Paths.redGirl,
    isSi: true,
  );
  static const redGuy = SvgImage(
    imagePath: _Paths.redGuy,
    isSi: true,
  );

  static const redGuySmall = SvgImage(
    imagePath: _Paths.redGuySmall,
  );
}

class _Paths {
  static const basePath = "assets/images/illustrations";

  static const mapEmptyState = '$basePath/states/empty/map_empty_state.svg';
  static const noTasksEmptyState = '$basePath/states/empty/no_tasks_empty_state.svg';
  static const paymentError = '$basePath/states/error/payment_error.svg';
  static const comingSoon = '$basePath/states/other/soon.svg';

  static const blueGirl = '$basePath/avatars/blue_girl.si';
  static const redGirl = '$basePath/avatars/red_girl.si';
  static const redGuy = '$basePath/avatars/red_guy.si';
  static const redGuySmall = '$basePath/avatars/red_guy_small.svg';
}
