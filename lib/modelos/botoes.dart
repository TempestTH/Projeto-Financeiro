import 'package:flutter/material.dart';

class LoginButtons extends StatefulWidget {
  final VoidCallback? onPressed;
  String texto;
  LoginButtons({super.key, required this.onPressed, required this.texto});

  @override
  State<LoginButtons> createState() => _LoginButtonsState();
}

class _LoginButtonsState extends State<LoginButtons> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double screenWidth = MediaQuery.of(context).size.width;

      // Lógica para definir o tamanho do botão com base na largura da tela
      double buttonWidth = screenWidth < 500 ? 150 : 200;
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffb3b3b3), // Cor de fundo
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          minimumSize: Size(buttonWidth, 40), // Define o tamanho do botão
        ),
        onPressed: widget.onPressed,
        child: Text(
          widget.texto,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      );
    });
  }
}
