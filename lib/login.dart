// ignore_for_file: unnecessary_null_comparison

import 'package:app_treinow_movies/cadastro.dart';
import 'package:app_treinow_movies/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = "";
  String senha = "";

  checkPref() async {
    var prefs = await SharedPreferences.getInstance();
    String? emailPref = prefs.getString('email');
    String? senhaPref = prefs.getString('senha');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _exibirAlerta() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Email ou Senha inválidos"),
            content: new Text("Digite os dados salvos anteriormente"),
            actions: <Widget>[
              // define os botões na base do dialogo
              new ElevatedButton(
                child: new Text("Fechar"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Treinow Movies"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "http://cdn.onlinewebfonts.com/svg/img_311846.png",
                  width: 120,
                ),
              ),
              TextField(
                onChanged: (text) {
                  email = text;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Email"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: (text) {
                  senha = text;
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Senha"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () => Get.to(Cadastro()),
                    child: Text("Cadastre se"),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        var prefs = await SharedPreferences.getInstance();
                        String? emailPref = prefs.getString('email');
                        String? senhaPref = prefs.getString('senha');

                        if (emailPref == email && senhaPref == senha) {
                          Get.to(Home());
                        } else {
                          _exibirAlerta();
                        }
                      },
                      child: Text("Entrar")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
