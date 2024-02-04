import 'package:dafit_task/app.dart';
import 'package:dafit_task/injection_container.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initSL();
  runApp(const DafitTask());
}
