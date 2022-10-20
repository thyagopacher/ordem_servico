import 'package:flutter/material.dart';
import 'package:ordem_servico/provider/users.dart';
import 'package:ordem_servico/routes/app_routes.dart';
import 'package:ordem_servico/views/user_form.dart';
import 'package:ordem_servico/views/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ordem de Serviço',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        routes: {
          AppRoutes.HOME:(_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),    
    );
  }
}
