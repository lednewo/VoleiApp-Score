import 'package:flutter/material.dart';
import 'package:placar_volei/src/app_widget.dart';
import 'package:placar_volei/src/ui/home_view/controller/home_view_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewController(),
        ),
      ],
      child: AppWidget(),
    ),
  );
}
