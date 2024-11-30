import 'package:flutter/material.dart';
import 'package:nha_sach_ckc/Provider/Book_Provider.dart';
import 'package:nha_sach_ckc/Screens/cart.dart';
import 'package:nha_sach_ckc/Screens/detail.dart';
import 'package:nha_sach_ckc/Screens/home_page.dart';
import 'package:nha_sach_ckc/Screens/signin.dart';
import 'package:nha_sach_ckc/Screens/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BookProvider())
      ],
      child: const MainApp(),
    )
  );
}

class MyCustomScrollBehavior extends MaterialScrollBehavior{
  const MyCustomScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    var books =Provider.of<BookProvider>(context, listen: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        fontFamily: 'Arial',
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SignIn(),
        '/signup': (context) => const SignUp(),
        '/home': (context) => HomePage(products: books.booksInHome),
        '/detail':(context)=> const Detail(),
        '/cart': (context)=> const Cart()
      },
    );
  }
}

