import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/Bloc/bloc/blocs.dart';
import 'package:learn_flutter/Services/services.dart';
import 'package:provider/provider.dart';

import 'UI/Pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      initialData: null,
      child: MultiBlocProvider(
          providers: [BlocProvider(create: (_) => PageBloc())],
          child: const MaterialApp(
              debugShowCheckedModeBanner: false, home: Wrapper())),
    );
  }
}
