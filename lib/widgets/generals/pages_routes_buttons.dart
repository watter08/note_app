import 'package:flutter/material.dart';


enum AppPages { notes, schedule, task }


class PagesRoutesButtons extends StatefulWidget {
  const PagesRoutesButtons({super.key});

  @override
  State<PagesRoutesButtons> createState() => _PagesRoutesButtonsState();
}

class _PagesRoutesButtonsState extends State<PagesRoutesButtons> {
  AppPages appPages = AppPages.notes;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<AppPages>(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith(
              (Set<WidgetState> states){
                if(states.contains(WidgetState.selected)){
                  return const TextStyle(color: Colors.deepPurple);
                }
                return const TextStyle(color: Colors.black38);
              }
            ),
        iconColor: WidgetStateProperty.resolveWith(
              (Set<WidgetState> states){
                if(states.contains(WidgetState.selected)){
                  return Colors.deepPurple;
                }
                return Colors.black38;
              }
            ),
            backgroundColor: WidgetStateProperty.all(Colors.white),
            side: WidgetStateProperty.all<BorderSide>(BorderSide.none), // Remove border
            shape: WidgetStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),
      segments:  <ButtonSegment<AppPages>>[
        customButtonSegment(
          icon: const Icon(Icons.note), 
          label: 'Notas', 
          page: AppPages.notes, 
          selectedPage: appPages
          ),
          customButtonSegment(
          icon: const Icon(Icons.schedule), 
          label: 'Agenda', 
          page: AppPages.schedule, 
          selectedPage: appPages
          ),
          customButtonSegment(
          icon: const Icon(Icons.task), 
          label: 'Tareas', 
          page: AppPages.task, 
          selectedPage: appPages
          )
      ],
      selected: <AppPages>{appPages},
      onSelectionChanged: (Set<AppPages> newSelection) {
        setState(() {
          appPages = newSelection.first;
        });
      },
    );
  }

  ButtonSegment<AppPages> customButtonSegment({
    required AppPages page, 
    required String label , 
    required Icon icon , 
    required AppPages selectedPage
    }) {

    return ButtonSegment<AppPages>(
          value: page,
          icon: icon,
          label: Text(
            label, 
            style: TextStyle(
              color: selectedPage == page ? Colors.deepPurple : Colors.black38
            )));          
  }
}