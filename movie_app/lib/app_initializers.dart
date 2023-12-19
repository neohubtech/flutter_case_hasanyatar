import 'package:movie_app/core/config/app_config.dart';
import 'package:movie_app/core/interfaces/initialization_adapter.dart';
import 'package:movie_app/core/network/network_manager.dart';

class AppInitializers {
  static Future<void> initialize() async {
    final features = <InitializationAdapter>[
      //! Warning: The order of initialization is important..!
      AppConfig(),
      NetworkManager(),
    ];

    for (final feature in features) {
      await feature.initialize();
    }
  }
}
