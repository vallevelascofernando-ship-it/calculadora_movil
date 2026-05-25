class CalculadoraLogica {
  String pantalla = '0';
  double _primerNumero = 0;
  String _operador = '';
  bool _reiniciarPantalla = false;

  void presionarBoton(String texto) {
    if (pantalla == 'Error') {
      pantalla = '0';
    }
    if (_esNumero(texto) || texto == '.') {
      _procesarNumero(texto);
    } else if (texto == '+' || texto == '-' || texto == '*' || texto == '/') {
      _procesarOperacion(texto);
    } else if (texto == '=') {
      _calcularResultado();
    } else if (texto == 'AC') {
      _limpiarCalculadora();
    } else if (texto == '+/-') {
      _cambiarSigno();
    }
  }

  void _procesarNumero(String texto) {
    if (pantalla == '0' && texto != '.' || _reiniciarPantalla) {
      pantalla = texto;
      _reiniciarPantalla = false;
    } else {
      if (texto == '.' && pantalla.contains('.')) return;
      pantalla += texto;
    }
  }

  void _procesarOperacion(String nuevoOperador) {
    _primerNumero = double.tryParse(pantalla) ?? 0;
    _operador = nuevoOperador;
    _reiniciarPantalla = true;
  }

  void _calcularResultado() {
    if (_operador.isEmpty) return;

    double segundoNumero = double.tryParse(pantalla) ?? 0;
    double resultado = 0;
    if (_operador == '/') {
      if (segundoNumero == 0) {
        pantalla = 'Error';
        _operador = '';
        return;
      }
      resultado = _primerNumero / segundoNumero;
    } else if (_operador == '+') {
      resultado = _primerNumero + segundoNumero;
    } else if (_operador == '-') {
      resultado = _primerNumero - segundoNumero;
    } else if (_operador == '*') {
      resultado = _primerNumero * segundoNumero;
    }

    if (resultado % 1 == 0) {
      pantalla = resultado.toInt().toString();
    } else {
      pantalla = resultado.toString();
    }

    _operador = '';
  }

  void _limpiarCalculadora() {
    pantalla = '0';
    _primerNumero = 0;
    _operador = '';
    _reiniciarPantalla = false;
  }

  void _cambiarSigno() {
    double valor = double.tryParse(pantalla) ?? 0;
    if (valor == 0) return; // El cero no cambia de signo

    valor = valor * -1;

    if (valor % 1 == 0) {
      pantalla = valor.toInt().toString();
    } else {
      pantalla = valor.toString();
    }
  }

  bool _esNumero(String texto) {
    return int.tryParse(texto) != null;
  }
}
