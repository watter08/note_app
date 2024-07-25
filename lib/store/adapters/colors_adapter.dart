import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

class MaterialColorAdapter extends TypeAdapter<MaterialColor> {
  @override
  final typeId = 3; // Debe ser un número único para el adaptador

  @override
  MaterialColor read(BinaryReader reader) {
    // Aquí debes implementar cómo leer el MaterialColor desde el binario
    // Por ejemplo, podrías guardar un índice o un código hexadecimal
    final colorValue = reader.readInt();
    return MaterialColor(colorValue, const {});
  }

  @override
  void write(BinaryWriter writer, MaterialColor obj) {
    // Aquí debes implementar cómo escribir el MaterialColor al binario
    // Por ejemplo, podrías guardar un índice o un código hexadecimal
    writer.writeInt(obj.value);
  }
}
