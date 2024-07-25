import 'package:flutter/material.dart';
import 'package:note_app/widgets/theme/custom_app_bar_clipper.dart';

class ShapeWaveAppbar extends PreferredSize {
  final List<Color> colorGradient;

  ShapeWaveAppbar({super.key, required this.colorGradient})
      : super(
          preferredSize: const Size.fromHeight(80),
          child: ClipPath(
            clipper: CustomAppBarClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: colorGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: AppBar(
                  leading: IconButton(
                      icon: const Icon(Icons.apps),
                      style: ButtonStyle(
                        iconColor: WidgetStateProperty.all<Color>(Colors.white),
                        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero), // Elimina el padding interno del botón
                      ),
                      onPressed: () {},
                    ),
                title:const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                  'Agenda y Notas',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 2,
              ),
              )
            ),
          ),
        );
}
