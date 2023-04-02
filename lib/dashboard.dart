import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex_pam/models/pokemon.dart';

class Dashboard extends StatefulWidget {
  const Dashboard(this.user, {Key? key}) : super(key: key);
  final User user;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<dynamic> pokemonList = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('images/pokemon.json');
    final data = await json.decode(response);

    setState(() {
      pokemonList =
          data['pokemons'].map((data) => Pokemon.fromJson(data)).toList();
    });
  }

  @override
  void initState() {
    super.initState();

    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 50,
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "images/ash.jpg",
            ),
          ),
        ],
        title: Container(
          height: 45,
          child: TextField(
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none),
              hintText: "Search Pokemon",
              hintStyle: TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(30),
          itemCount: pokemonList.length,
          itemBuilder: (context, index) {
            return pokemonComponent(pokemon: pokemonList[index]);
          },
        ),
      ),
    );
  }

  pokemonComponent({required Pokemon pokemon}) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(pokemon.image),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pokemon.name,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(pokemon.abilities,
                              style: TextStyle(color: Colors.green[500])),
                          Text(pokemon.weight,
                              style: TextStyle(color: Colors.green[500])),
                          Text(pokemon.height,
                              style: TextStyle(color: Colors.green[500])),
                        ]),
                  ),
                ],
              )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200),
                      child: Text(
                        pokemon.category,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class User {
  final String username, email, password;
  const User(this.username, this.email, this.password);
}
