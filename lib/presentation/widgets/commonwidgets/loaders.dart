import 'package:flutter/material.dart';

class Loaders {
  Loaders._();

  static void hideSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  static void customToast(BuildContext context, {required String message}) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: (isDark ? Colors.grey[800] : Colors.grey[300])
                ?.withValues(alpha: 0.95),
          ),
          child: Center(
            child: Text(
              message,
              style: theme.textTheme.bodySmall?.copyWith(
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void successSnackBar(
    BuildContext context, {
    required String title,
    String message = '',
    int durationSeconds = 3,
  }) {
    final theme = Theme.of(context);
    _showSnackBar(
      context: context,
      title: title,
      message: message,
      duration: Duration(seconds: durationSeconds),
      backgroundColor: theme.colorScheme.primary,
      icon: Icons.check_circle,
      iconColor: Colors.white,
    );
  }

  static void warningSnackBar(
    BuildContext context, {
    required String title,
    String message = '',
  }) {
    _showSnackBar(
      context: context,
      title: title,
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.orange.shade700,
      icon: Icons.warning_amber_rounded,
      iconColor: Colors.white,
    );
  }

  static void errorSnackBar(
    BuildContext context, {
    required String title,
    String message = '',
  }) {
    final theme = Theme.of(context);
    _showSnackBar(
      context: context,
      title: title,
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: theme.colorScheme.error,
      icon: Icons.error_outline,
      iconColor: Colors.white,
    );
  }

  static void _showSnackBar({
    required BuildContext context,
    required String title,
    required String message,
    required Duration duration,
    required Color backgroundColor,
    required IconData icon,
    required Color iconColor,
  }) {
    final theme = Theme.of(context);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (message.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      message,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        backgroundColor: backgroundColor,
        duration: duration,
        margin: const EdgeInsets.all(10),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
