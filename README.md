# Notas App

![Captura de Pantalla 1](ruta/a/imagen1.png) ![Captura de Pantalla 2](ruta/a/imagen2.png) ![Captura de Pantalla 3](ruta/a/imagen3.png)

**Notas App** es una aplicación intuitiva y visualmente atractiva diseñada para ayudarte a gestionar tus notas de manera eficiente. La aplicación permite a los usuarios guardar notas con diferentes categorías y estilos de colores, filtrar notas por categoría o título, y proporciona una experiencia de usuario fluida y personalizada.

## Características

- **Gestión de Notas:** Guarda notas con propiedades personalizables, incluyendo título, descripción, fecha de creación, color, categoría y emoji.
- **Filtrado y Búsqueda:** Filtra tus notas por categoría o título para encontrar rápidamente lo que necesitas.
- **Formulario de Notas:** Crea y edita notas utilizando un formulario sencillo y fácil de usar.
- **Vista Detallada:** Visualiza los detalles completos de cada nota seleccionada.
- **Notificaciones:** Notifica al usuario sobre el estado de las operaciones con Toastify (éxito, advertencia, información o error).
- **Eliminación de Notas:** Elimina notas fácilmente con un diseño intuitivo.
- **Splash Screen:** Pantalla de bienvenida o error para una experiencia de usuario consistente.
- **Widgets Personalizados:** Amplia variedad de widgets personalizados para una interfaz adaptada a tus necesidades.

## Modelo de Nota

La aplicación utiliza el siguiente modelo para las notas:

```dart
@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  late int noteId;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final DateTime creationDate;

  @HiveField(4)
  final Color color;

  @HiveField(5)
  final String category;

  @HiveField(6)
  final String emoji;

  NoteModel({
    required this.noteId,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.color,
    required this.category,
    required this.emoji
  });
}
```
# Dependencias

## La aplicación utiliza las siguientes dependencias para proporcionar una experiencia fluida y moderna:

### provider: ^6.1.2
### hive: ^2.0.5
### hive_flutter: ^1.1.0
### emoji_picker_flutter: ^1.0.0
### toastification: ^2.1.0
### auto_route: ^8.1.0
### intl: ^0.18.0
### hive_generator: ^2.0.1
### build_runner: ^2.3.0
### auto_route_generator: ^8.1.0


# Instalación
## Para instalar la aplicación, sigue estos pasos:

# Clona el repositorio:

## git clone https://github.com/watter08/note_app.git

# Instala las dependencias:

## flutter pub get

# Licencia
## Este proyecto está licenciado bajo la MIT License.