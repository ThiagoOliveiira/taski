import 'package:hive_flutter/hive_flutter.dart';

import '../../data/data.dart';

class HiveConfig {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoModelAdapter());
  }
}
