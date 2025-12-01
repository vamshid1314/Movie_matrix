import 'package:logger/logger.dart';

class AppLogger{
  static final Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
    ),
  );

  static void i(dynamic message) => logger.i(message);
  static void d(dynamic message) => logger.d(message);
  static void w(dynamic message) => logger.w(message);
  static void e(dynamic message) => logger.e(message);
}