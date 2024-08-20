import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF5c11d4);

const List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.blue,
  Colors.teal,
  Colors.red,
  Colors.orange,
  Colors.cyan,
  Colors.green,
  Colors.purple,
  Colors.yellow,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;

  AppTheme({required this.selectedColor, this.isDarkMode = false})
      : assert(selectedColor >= 0 && selectedColor < _colorThemes.length,
            'Colors must been between 0 and 10');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor],
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
    );
  }
}
