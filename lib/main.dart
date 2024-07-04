import 'package:flutter/material.dart';
import 'package:nectar/core/services/service_locator.dart';
import 'package:nectar/nectra_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator.init();
  runApp(const MyApp());
}
