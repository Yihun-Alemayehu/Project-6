import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_6/image_gallary_bloc/image_gallery_bloc.dart';
import 'package:project_6/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => ImageGalleryBloc(),
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
