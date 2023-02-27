import 'package:app_treinow_movies/home.dart';
import 'package:app_treinow_movies/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? _emailErrorText;
  bool _emailError = false;
  String? _senhaErrorText;
  bool _senhaError = false;

  String validarForm(String value) {
    if (value.isEmpty) {
      return "Digite a senha";
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro Treinow Movies"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/4745/4745448.png",
                  width: 150,
                ),
              ),
              TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Digite o Email";
                  }

                  return null;
                },
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Digite a Senha";
                  }

                  return null;
                },
                controller: _senhaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Senha",
                  prefixIcon: Icon(Icons.password),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () async {
                    var prefs = await SharedPreferences.getInstance();
                    if (_formKey.currentState?.validate() == true) {
                      prefs.setString('email', _emailController.text);
                      prefs.setString('senha', _senhaController.text);
                      Get.to(Login());
                    }
                  },
                  child: Text("Cadastrar"))
            ]),
          ),
        ));
  }
}
