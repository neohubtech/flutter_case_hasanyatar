import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/core/interfaces/initialization_adapter.dart';

class AppConfig implements InitializationAdapter {
  static late String baseUrl;
  // Other app configurations can be added here.

  @override
  Future<FutureOr<void>> initialize() async {
    await dotenv.load(fileName: 'assets/environment/dev.env');
    baseUrl = dotenv.env['BASE_URL'] ?? '';
  }
}
