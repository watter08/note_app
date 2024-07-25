  import 'package:intl/intl.dart';

String formatDateDifference(DateTime givenDate) {
    final DateTime now = DateTime.now().add(const Duration(days: 15));
    final Duration difference = now.difference(givenDate);

    // Formatear la fecha dada
    final String formattedDate = DateFormat('d MMMM yyyy').format(givenDate);

    // Calcular la diferencia en días
    final int days = (difference.inDays).abs();

    // Crear el texto de diferencia
    String differenceText;
    if (days == 0) {
      differenceText = 'hoy';
    } else if (days == 1) {
      differenceText = 'hace 1 día';
    } else {
      differenceText = 'hace $days días';
    }

    // Combinar ambos textos
    return '$formattedDate $differenceText';
  }