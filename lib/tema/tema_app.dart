import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Clase para definir el tema visual global de la aplicación
class AppTheme {
  static final theme = ThemeData(
    useMaterial3:
        true, //  Usa Material 3 (versión moderna de diseño en Flutter)

    // Define una paleta de colores basada en un color semilla
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

    //  Color de fondo general de toda la app (pantallas)
    scaffoldBackgroundColor: const Color(0xFFF3F4F6), // Un gris claro elegante

    // Estilo de texto global usando la fuente de Google Fonts (Poppins)
    textTheme: GoogleFonts.poppinsTextTheme(),

    //  Estilo global para botones elevados (ElevatedButton)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple, // Color del botón
        foregroundColor: Colors.white, // Color del texto/ícono
        shape: RoundedRectangleBorder(
          // Bordes redondeados
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),

    // Estilo global para la AppBar (barra superior)
    appBarTheme: const AppBarTheme(
      elevation: 0, // Sin sombra
      backgroundColor: Colors.transparent, // Fondo transparente
      foregroundColor: Colors.black87, // Color de texto/íconos
    ),
  );
}
