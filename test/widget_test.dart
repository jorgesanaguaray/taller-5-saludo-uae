// dart format off
// Los comentarios al final de cada línea forman parte de la entrega.
import 'package:flutter/material.dart'; // Proporciona TextField para la prueba.
import 'package:flutter_test/flutter_test.dart'; // Proporciona las utilidades de prueba.
import 'package:saludo_uae/main.dart'; // Importa el widget raíz del taller.

void main() { // Registra la prueba del formulario.
  testWidgets('Valida el nombre y muestra el saludo', (tester) async { // Prueba el flujo.
    await tester.pumpWidget(const SaludoUAE()); // Monta la aplicación.
    final campo = find.byType(TextField); // Localiza la entrada de nombre.
    final boton = find.text('Saludar'); // Localiza el botón del formulario.
    final aviso = find.text('Ingresa tu nombre para continuar.'); // Busca el aviso.
    final saludo = find.text('¡Hola, Juan! Bienvenido a la UAE'); // Busca el resultado.

    expect(aviso, findsNothing); // El formulario empieza sin aviso.
    expect(saludo, findsNothing); // El formulario empieza sin saludo.
    await tester.tap(boton); // Envía el campo vacío.
    await tester.pump(); // Reconstruye la pantalla.
    expect(aviso, findsOneWidget); // Comprueba que se pidió el nombre.

    await tester.enterText(campo, '  Juan  '); // Escribe un nombre con espacios.
    await tester.tap(boton); // Envía el nombre.
    await tester.pump(); // Reconstruye la pantalla con el saludo.
    expect(saludo, findsOneWidget); // Verifica el saludo con el nombre limpio.
    expect(aviso, findsNothing); // Comprueba que desapareció el aviso anterior.

    await tester.enterText(campo, '   '); // Deja el campo con espacios únicamente.
    await tester.testTextInput.receiveAction(TextInputAction.done); // Envía desde el teclado.
    await tester.pump(); // Reconstruye la pantalla con el aviso.
    expect(aviso, findsOneWidget); // Verifica que se rechazaron los espacios.
    expect(saludo, findsNothing); // Comprueba que se reemplazó el saludo anterior.
  }); // Termina el caso de prueba.
} // Cierra el registro de pruebas.
