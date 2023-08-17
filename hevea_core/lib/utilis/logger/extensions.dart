import 'package:hevea_core/utilis/logger/g_logger.dart';

extension ExceptionLogger on Object {
  /// An easy way to log the exception.
  void logException({StackTrace? stackTrace}) {
    if (this is Error || this is Exception) {
      GLogger.error('$this', stackTrace: stackTrace);
    }
  }
}
