import 'package:flutter/material.dart';
import 'package:pokedex_pam/login_page.dart';

class GettingStart extends StatelessWidget {
  const GettingStart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            height: 90,
          ),
          Text(
            "Pokedex.",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w700,
              color: Colors.amber,
            ),
          ),
          SizedBox(
            height: 59,
          ),
          Text(
            "Welcome to Pokedex",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          Text(
            "You can find your favorite pokemon here",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 110,
          ),
          Image(
            image: AssetImage("images/pokeball2.png"),
            height: 144,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_right_alt),
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
