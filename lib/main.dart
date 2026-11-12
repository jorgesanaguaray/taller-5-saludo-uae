// ignore_for_file: avoid_print
// dart format off
// Los comentarios al final de cada línea forman parte de la entrega.
// El taller pide usar print() para observar el flujo de la app en modo debug.
import 'package:flutter/foundation.dart'; // Proporciona kDebugMode.
import 'package:flutter/material.dart'; // Proporciona los widgets de Material.

void main() { // Punto de entrada de Flutter.
  if (kDebugMode) { // Registra el arranque en modo debug.
    print('Iniciando SaludoUAE.'); // Identifica la aplicación en la consola.
  } // Cierra el registro de arranque.
  runApp(const SaludoUAE()); // Monta el widget raíz.
} // Cierra el punto de entrada.

class SaludoUAE extends StatelessWidget { // Define la app y su tema.
  const SaludoUAE({super.key}); // Crea el widget raíz.

  @override // Implementa la construcción de la app.
  Widget build(BuildContext context) { // Construye la configuración de Material.
    return MaterialApp( // Aplica el tema y presenta la pantalla inicial.
      title: 'SaludoUAE', // Identifica la aplicación en el sistema.
      debugShowCheckedModeBanner: false, // Oculta el rótulo de depuración.
      theme: ThemeData(colorSchemeSeed: const Color(0xFF1B5E9E)), // Tema azul.
      home: const PantallaSaludo(), // Abre el formulario.
    ); // Cierra la configuración de Material.
  } // Termina la construcción de la app.
} // Cierra el widget raíz.

class PantallaSaludo extends StatefulWidget { // Mantiene el estado del formulario.
  const PantallaSaludo({super.key}); // Crea la pantalla del saludo.

  @override // Vincula el widget con su estado mutable.
  State<PantallaSaludo> createState() => _PantallaSaludoState(); // Crea el estado.
} // Cierra el widget de la pantalla.

class _PantallaSaludoState extends State<PantallaSaludo> { // Conserva el formulario.
  final TextEditingController _ctrl = TextEditingController(); // Controla el campo.
  String _resultado = ''; // Empieza sin saludo ni aviso.

  void _saludar() { // Atiende el botón y la acción del teclado.
    if (kDebugMode) { // Registra la acción del usuario en modo debug.
      print('Saludo solicitado.'); // Identifica el intento de saludo.
    } // Cierra el registro de la acción.
    final nombre = _ctrl.text.trim(); // Lee el nombre y quita espacios exteriores.
    final estaVacio = nombre.isEmpty; // Comprueba si falta el nombre.
    if (kDebugMode) { // Muestra la validación en la consola de depuración.
      print( // Registra si el campo contiene texto.
        estaVacio ? 'Nombre vacío.' : 'Nombre válido.', // Omite el nombre escrito.
      ); // Finaliza el registro de validación.
    } // Cierra el registro de depuración.

    setState(() { // Solicita reconstruir la pantalla con el nuevo mensaje.
      _resultado = estaVacio // Decide cuál de los dos mensajes se mostrará.
          ? 'Ingresa tu nombre para continuar.' // Avisa que falta el nombre.
          : '¡Hola, $nombre! Bienvenido a la UAE'; // Personaliza el saludo.
    }); // Termina la actualización del estado.
    FocusScope.of(context).unfocus(); // Cierra el teclado para mostrar el mensaje.
    if (kDebugMode) { // Registra el resultado en modo debug.
      print('Resultado actualizado.'); // Confirma el cambio de estado.
    } // Cierra el registro del resultado.
  } // Termina el procesamiento del saludo.

  @override // Libera recursos cuando se retira la pantalla.
  void dispose() { // Limpia el estado del formulario.
    _ctrl.dispose(); // Libera el controlador del campo de nombre.
    super.dispose(); // Completa la limpieza de la clase base.
  } // Termina la liberación de recursos.

  @override // Implementa el árbol de widgets de la pantalla.
  Widget build(BuildContext context) { // Usa el resultado actual del formulario.
    return Scaffold( // Organiza la barra superior y el cuerpo.
      appBar: AppBar( // Presenta el título del formulario.
        title: const Text('Saludo UAE'), // Muestra el título de la referencia.
        backgroundColor: const Color(0xFF1B5E9E), // Pinta la barra de azul.
        foregroundColor: Colors.white, // Mantiene el título legible sobre azul.
      ), // Cierra la barra superior.
      body: Padding( // Separa el formulario de los bordes.
        padding: const EdgeInsets.all(24), // Define el margen interior.
        child: SingleChildScrollView( // Permite desplazarse al abrir el teclado.
          child: Center( // Centra el formulario en pantallas anchas.
            child: ConstrainedBox( // Controla el ancho máximo del formulario.
              constraints: const BoxConstraints(maxWidth: 480), // Limita el ancho.
              child: Column( // Apila los controles de arriba hacia abajo.
                crossAxisAlignment: CrossAxisAlignment.stretch, // Iguala los anchos.
                children: [ // Reúne la etiqueta, el campo, el botón y el mensaje.
                  const Text('Ingresa tu nombre'), // Indica qué escribir.
                  const SizedBox(height: 8), // Separa la etiqueta del campo.
                  TextField( // Recibe el nombre de la persona.
                    controller: _ctrl, // Enlaza el campo con su controlador.
                    textCapitalization: TextCapitalization.words, // Sugiere iniciales mayúsculas.
                    textInputAction: TextInputAction.done, // Ofrece finalizar desde el teclado.
                    onSubmitted: (_) => _saludar(), // Saluda también al finalizar la edición.
                    decoration: const InputDecoration( // Define el aspecto del campo.
                      hintText: 'Ej. Juan', // Muestra un ejemplo con el campo vacío.
                      border: OutlineInputBorder(), // Delimita el área de entrada.
                    ), // Cierra la decoración.
                  ), // Cierra el campo de nombre.
                  const SizedBox(height: 16), // Separa el campo del botón.
                  ElevatedButton( // Presenta la acción principal del formulario.
                    onPressed: _saludar, // Valida y actualiza el resultado.
                    style: ElevatedButton.styleFrom( // Ajusta el botón a la referencia.
                      backgroundColor: const Color(0xFF2E7D32), // Usa fondo verde.
                      foregroundColor: Colors.white, // Usa texto blanco.
                      minimumSize: const Size(0, 48), // Asegura una altura táctil cómoda.
                      shape: const RoundedRectangleBorder( // Define las esquinas.
                        borderRadius: BorderRadius.all(Radius.circular(8)), // Redondea el borde.
                      ), // Cierra la forma del botón.
                    ), // Cierra el estilo del botón.
                    child: const Text('Saludar'), // Nombra la acción visible.
                  ), // Cierra el botón.
                  const SizedBox(height: 16), // Deja espacio antes del mensaje.
                  Semantics( // Hace accesible el resultado dinámico.
                    liveRegion: true, // Anuncia cambios con un lector de pantalla.
                    child: Text( // Muestra el aviso o el saludo actual.
                      _resultado, // Lee el mensaje guardado en el estado.
                      style: const TextStyle( // Destaca el resultado.
                        color: Color(0xFF163E65), // Usa azul oscuro para el mensaje.
                        fontWeight: FontWeight.bold, // Destaca el texto en negrita.
                      ), // Cierra el estilo del resultado.
                    ), // Cierra el texto del resultado.
                  ), // Cierra la región accesible.
                ], // Cierra la lista de controles.
              ), // Cierra la columna del formulario.
            ), // Cierra la restricción de ancho.
          ), // Cierra el centrado horizontal.
        ), // Cierra el contenedor desplazable.
      ), // Cierra el margen interior.
    ); // Cierra la estructura de la pantalla.
  } // Termina la construcción de la interfaz.
} // Cierra el estado del formulario.
