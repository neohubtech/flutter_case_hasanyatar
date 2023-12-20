import 'package:movie_app/core/config/app_config.dart';
import 'package:movie_app/core/interfaces/initialization_adapter.dart';
import 'package:movie_app/core/network/network_manager.dart';
import 'package:movie_app/utilities/di/dependency_injection.dart';

class AppInitializers {
  static Future<void> initialize() async {
    final features = <InitializationAdapter>[
      //! Warning: The order of initialization is important..!

      DependencyInjection.shared
    ];

    for (final feature in features) {
      await feature.initialize();
    }
  }
}
