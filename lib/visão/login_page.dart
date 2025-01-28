import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:segredo/controle/variavel.dart';
import 'package:segredo/modelos/botoes.dart';
import 'package:segredo/modelos/boxTexto.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var Firestore = FirebaseFirestore.instance;

  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          color: const Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.only(
            top: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 200),
              //-------------------------------EMAIL-----------------------------------------//
              Container(
                width: MediaQuery.of(context).size.width < 500 ? 300 : 400,
                child: const Text(
                  "Email",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),
                ),
              ),
              Boxtexto(
                height: 45,
                width: 300,
                texto: TextField(
                  onChanged: (Text) {
                    context.read<AppState>().updateEmail(Text);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              //-------------------------------SENHA-----------------------------------------//
              Container(
                width: MediaQuery.of(context).size.width < 500 ? 300 : 400,
                child: const Text(
                  "Senha",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 16,
                  ),
                ),
              ),
              Boxtexto(
                height: 45,
                width: 300,
                texto: TextField(
                  onChanged: (Text) {
                    context.read<AppState>().updateSenha(Text);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  )),
                  keyboardType: TextInputType.visiblePassword,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              //-------------------------------ESQUECI A SENHA-----------------------------------------//
              Container(
                width: MediaQuery.of(context).size.width < 500 ? 370 : 500,
                alignment: const Alignment(0.75, 0.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "esqueci minha senha",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              //-------------------------------BOTÕES-----------------------------------------//
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //-------------------------------BOTÃO CADASTRO-----------------------------------------//
                  LoginButtons(onPressed: () async {}, texto: "Cadastro"),
                  const SizedBox(width: 10),
                  //-------------------------------BOTÃO LOGIN-----------------------------------------//
                  LoginButtons(
                      onPressed: () async {
                        var resultado = await Firestore.collection("usuario")
                            .where("email", isEqualTo: context.read<AppState>().email)
                            .get();

                        if (resultado.docs.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Color.fromARGB(255, 22, 19, 161),
                            content: Text("Usuario não encontrado."),
                            duration: const Duration(seconds: 2),
                          ));
                        } else {
                          if (resultado.docs[0]['email'] == context.read<AppState>().email &&
                              resultado.docs[0]['senha'] == context.read<AppState>().senha) {
                            Navigator.of(context).pushReplacementNamed('HomePage');
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              backgroundColor:
                                  const Color.fromARGB(255, 22, 22, 22),
                              content: Text("Usuario ou senha incorretos."),
                              duration: const Duration(seconds: 2),
                            ));
                          }
                        }

                        //Navigator.of(context).pushReplacementNamed('Home');
                      },
                      texto: "Login"),
                ],
              ),
              //-------------------------------RODAPÉ-----------------------------------------//
            ],
          ),
        ),
      ),
    );
  }
}
