import 'package:flutter/material.dart';
import 'package:note_app/store/const/inspirations/emoticons_const.dart';

class EmojiPicker extends StatelessWidget {
  final Function(String) onEmojiSelected;
  const EmojiPicker({super.key, required this.onEmojiSelected});

  @override
  Widget build(BuildContext context) {
    // Lista de emoticonos para el ejemplo

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Selecciona un emoticón:'),
        Wrap(
          spacing: 8.0,
          children: dropsEmojis.map((emoji) {
            return GestureDetector(
              onTap: () => onEmojiSelected(emoji),
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 24),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}