import 'package:flutter/material.dart';
import 'package:machinetesapi/Loginpage.dart';

void main()
{

  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(home: LoginPage(),
    debugShowCheckedModeBanner: false,);
  }
}