import 'package:flutter/material.dart';

import 'provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(await AppProvider.providers());
}
