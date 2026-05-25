import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _pantallaVisual = '0';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.black,
        middle: Text(
          'Calculadora iOS, Fernando Valle Velasco',
          style: TextStyle(color: CupertinoColors.white),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                child: Text(
                  _pantallaVisual,
                  style: const TextStyle(
                    fontSize: 72,
                    fontWeight: FontWeight.w300,
                    color: CupertinoColors.white,
                  ),
                ),
              ),
            ),
            _filaBotones(['AC', '+/-', '%', '/']),
            _filaBotones(['7', '8', '9', '*']),
            _filaBotones(['4', '5', '6', '-']),
            _filaBotones(['1', '2', '3', '+']),
            _filaBotones(['0', '.', '=']),
          ],
        ),
      ),
    );
  }

  Widget _filaBotones(List<String> textos) {
    return Row(
      children: textos.map((texto) {
        int flex = (texto == '0') ? 2 : 1;

        return Expanded(
          flex: flex,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              color: _obtenerColorBoton(texto),
              borderRadius: BorderRadius.circular(40),
              onPressed: () {},
              child: Text(
                texto,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w400,
                  color: _obtenerColorTexto(texto),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Color _obtenerColorBoton(String texto) {
    if (texto == '+' ||
        texto == '-' ||
        texto == '*' ||
        texto == '/' ||
        texto == '=') {
      return CupertinoColors.activeOrange;
    }
    if (texto == 'AC' || texto == '+/-' || texto == '%') {
      return CupertinoColors.systemGrey2;
    }
    return CupertinoColors.darkBackgroundGray;
  }

  Color _obtenerColorTexto(String texto) {
    if (texto == 'AC' || texto == '+/-' || texto == '%') {
      return CupertinoColors.black;
    }
    return CupertinoColors.white;
  }
}
