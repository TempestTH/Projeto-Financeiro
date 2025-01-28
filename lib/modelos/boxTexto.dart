import 'package:flutter/material.dart';

class Boxtexto extends StatelessWidget {
  double width;
  double height;
  Widget? texto;
  Boxtexto(
      {super.key,
      required this.height,
      required this.width,
      required this.texto});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
      double screenWidth = MediaQuery.of(context).size.width;

      // Lógica para definir o tamanho do botão com base na largura da tela
      double buttonWidth = screenWidth < 500 ? 300 : 400;
      return Container(
        width: buttonWidth,
        height: height,
        padding: const EdgeInsets.only(
            top: 0,
          ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          color: Colors.white,
        ),
        child: texto
      );
    });
  }
}
