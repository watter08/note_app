import 'dart:math';

final List<String> dropInspirationWords = [
  'Tú puedes',
  'Eres un regalo de Dios',
  'Quien como tú',
  'Sigue adelante',
  'Nunca te rindas',
  'Cree en ti misma',
  'El éxito es tuyo',
  'Hazlo con pasión',
  'Sé tu mejor versión',
  'La vida es bella',
  'Eres increíble',
  'Todo es posible',
  'El futuro es brillante',
  'Sigue tus sueños',
  'Eres fuerte',
  'Cada día es una oportunidad',
  'La vida te sonríe',
  'Eres capaz de grandes cosas',
  'Hoy es un buen día',
  'Hazlo por ti',
  'Tienes el poder',
  'Confía en el proceso',
  'Nunca pares de soñar',
  'Eres única',
  'Siempre hay esperanza',
  'Elige ser feliz',
  'La fe mueve montañas',
  'La actitud es todo',
  'Brilla con luz propia',
  'Tú eres tu mejor aliada',
  'Siempre puedes mejorar',
  'Crea tu propio destino',
  'La felicidad es tuya',
  'Vive en el presente',
  'Disfruta cada momento',
  'La gratitud es clave',
  'Eres luz en el mundo',
  'Tú eres suficiente',
  'El amor es la respuesta',
  'Siempre hay una salida',
  'Sé valiente',
  'Vive sin miedo',
  'Eres una campeóna',
  'La vida es un regalo',
  'El esfuerzo vale la pena',
  'Confía en ti',
  'Tú tienes el control',
];


String getRandomInspiration(List<String> inspirations) {
  final random = Random();
  final index = random.nextInt(inspirations.length);
  return inspirations[index];
}