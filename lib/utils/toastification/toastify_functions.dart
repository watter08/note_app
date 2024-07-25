import 'package:flutter/material.dart';
import 'package:note_app/store/enums/toastification/type_toastification_message_icon_enum.dart';
import 'package:toastification/toastification.dart';

void showCustomToast({
  required String message,
  String? description,
  ETypeToastificationMessageIcon? type = ETypeToastificationMessageIcon.success
  }) {

    final Icon icon = _getIcon(type);
    final Color primaryColor = _getPrimaryColor(type);

  toastification.show(
  type: ToastificationType.success,
  style: ToastificationStyle.fillColored,
  autoCloseDuration: const Duration(seconds: 3),
  title: Text(message),
  description: RichText(text: TextSpan(text: description)),
  alignment: Alignment.topRight,
  direction: TextDirection.ltr,
  animationDuration: const Duration(milliseconds: 300),
  animationBuilder: (context, animation, alignment, child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  },
  icon: icon,
  showIcon: true, 
  primaryColor: primaryColor,
  backgroundColor: Colors.white,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  borderRadius: BorderRadius.circular(12),
  boxShadow: const [
    BoxShadow(
      color: Color(0x07000000),
      blurRadius: 16,
      offset: Offset(0, 16),
      spreadRadius: 0,
    )
  ],
  showProgressBar: true,
  closeButtonShowType: CloseButtonShowType.onHover,
  closeOnClick: false,
  pauseOnHover: true,
  dragToClose: true,
  applyBlurEffect: false,
  callbacks: ToastificationCallbacks(
    onTap: (toastItem) => {},
    onCloseButtonTap: (toastItem) => {},
    onAutoCompleteCompleted: (toastItem) => {},
    onDismissed: (toastItem) => {},
  ),
);
}

 _getIcon(ETypeToastificationMessageIcon? type){
  late Icon icon;
  if(type == ETypeToastificationMessageIcon.success) {
    icon = const Icon(Icons.check);
  }else if(type == ETypeToastificationMessageIcon.info){
    icon = const Icon(Icons.info);
  }else if(type == ETypeToastificationMessageIcon.warning){
    icon = const Icon(Icons.warning);
  }else if(type == ETypeToastificationMessageIcon.error){
    icon = const Icon(Icons.error);
  }else{
    icon = const Icon(Icons.error);
  }
  return icon;
}

 _getPrimaryColor(ETypeToastificationMessageIcon? type){
  late Color color;
  if(type == ETypeToastificationMessageIcon.success) {
    color =  const Color(0xFF00C9A7);
  }else if(type == ETypeToastificationMessageIcon.info){
    color =  const Color(0xFF0081CF);
  }else if(type == ETypeToastificationMessageIcon.warning){
    color =  const Color(0xFFDFBD1B);
  }else if(type == ETypeToastificationMessageIcon.error){
    color =  const Color(0xFFFF6F91);
  }else{
    color =  Colors.white;
  }
  return color;
}