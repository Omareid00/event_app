import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class Toast {
  static void showSuccessToast({
    Alignment align = Alignment.topCenter,
    Color backgroundColor = const Color(0xFF22C55E),
    Widget leading = const Icon(
      Icons.check_circle_rounded,
      color: Colors.white,
      size: 24,
    ),
    required String title,
    Widget? subtitle,
  }) {
    BotToast.showNotification(
      align: align,
      backgroundColor: backgroundColor,
      leading: (cancelFunc) => leading,
      title: (cancelFunc) => Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Cairo',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: subtitle != null ? (cancelFunc) => subtitle : null,
    );
  }

  static void showWarningToast({
    Alignment align = Alignment.topCenter,
    Color backgroundColor = const Color(0xFFFACC15),
    Widget leading = const Icon(
      Icons.warning_rounded,
      color: Color(0xFF1F2937),
      size: 24,
    ),
    required String title,
    Widget? subtitle,
    Duration duration = const Duration(seconds: 4),
  }) {
    BotToast.showNotification(
      align: align,
      backgroundColor: backgroundColor,
      leading: (cancelFunc) => leading,
      title: (cancelFunc) => Text(
        title,
        style: const TextStyle(
          color: Color(0xFF1F2937),
          fontFamily: 'Cairo',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: subtitle != null ? (cancelFunc) => subtitle : null,
      duration: duration,
    );
  }

  static void showErrorToast({
    Alignment align = Alignment.topCenter,
    Color backgroundColor = const Color(0xFFEF4444),
    Widget leading = const Icon(
      Icons.cancel_rounded,
      color: Colors.white,
      size: 24,
    ),
    required String title,
    Widget? subtitle,
  }) {
    BotToast.showNotification(
      align: align,
      backgroundColor: backgroundColor,
      leading: (cancelFunc) => leading,
      title: (cancelFunc) => Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontFamily: 'Cairo',
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      subtitle: subtitle != null ? (cancelFunc) => subtitle : null,
    );
  }
}
