// ignore_for_file: sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:sua_dieta/styles/components/label.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(200, 225, 190, 1),
      body: Container(
        height: 415,
        padding: const EdgeInsets.only(left: 26, right: 26),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 74,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'images/apple_icon.png',
                    width: 35,
                    height: 35,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Sua",
                          style: labelTextStyle['black'],
                        ),
                        TextSpan(
                          text: "Dieta",
                          style: labelTextStyle['white'],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: const Column(
                children: [
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Digite seu login",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.login),
                      prefixIconColor: Colors.grey,
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              child: const Column(
                children: [
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Digite sua senha",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.password),
                      prefixIconColor: Colors.grey,
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: null,
              style: ElevatedButton.styleFrom(
                elevation: 10,
                backgroundColor: const Color.fromRGBO(0, 226, 118, 255),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.login),
                  Text("Login"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
