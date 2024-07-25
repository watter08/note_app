import 'package:flutter/material.dart';
import 'package:note_app/store/const/inspirations/emoticons_const.dart';


class EmojiPickerModal extends StatefulWidget {
  final void Function(String) onEmojiSelected;

  const EmojiPickerModal({
    super.key,
    required this.onEmojiSelected,
  });

  @override
  EmojiPickerModalState createState() => EmojiPickerModalState();
}


class EmojiPickerModalState extends State<EmojiPickerModal> {
  String _selectedCategory = 'Alegría';
  String _selectedEmoji = emojiCategories['Alegría']?.first ?? '';

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF3A3A3A),
      title: const Center(child:  Text('Seleccionar Emoji', style: TextStyle(color: Colors.white),)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Dropdown para seleccionar la categoría
          SizedBox(
            width: double.infinity,
            child: DropdownButton<String>(
              isExpanded: true,
              style: const TextStyle(color: Colors.white),   
              dropdownColor: const Color(0xFF3A3A3A),       
              value: _selectedCategory,
              items: emojiCategories.keys.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (newCategory) {
                setState(() {
                  _selectedCategory = newCategory!;
                  _selectedEmoji = emojiCategories[_selectedCategory]?.first ?? '';
                });
              },
            ),
          ),
          // Emoji seleccionado
          Text('Seleccionado: $_selectedEmoji', style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 15),
          // GridView de emojis
          SizedBox(
            height: 200,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
              itemCount: emojiCategories[_selectedCategory]?.length ?? 0,
              itemBuilder: (context, index) {
                final emoji = emojiCategories[_selectedCategory]?[index] ?? '';
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedEmoji = emoji;
                    });
                    widget.onEmojiSelected(emoji);
                    Navigator.pop(context);
                  },
                  child: Center(
                    child: Text(
                      emoji,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



// ignore: must_be_immutable
class EmojiPickerButton extends StatelessWidget {
  final void Function(String) onEmojiSelected;

  const EmojiPickerButton({
    super.key,
    required this.onEmojiSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          minimumSize: WidgetStateProperty.all<Size>(const Size(double.infinity, 48)),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => EmojiPickerModal(
              onEmojiSelected: (String selectedEmoji) {
                onEmojiSelected(selectedEmoji);
              },
            ),
          );
        },
        child: const Text('Seleccionar Emoji'),
      ),
    );
  }
}
