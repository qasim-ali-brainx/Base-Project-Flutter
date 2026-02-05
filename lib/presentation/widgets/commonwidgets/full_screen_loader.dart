import 'package:flutter/material.dart';

class FullScreenLoader {
  FullScreenLoader._();

  static void openLoadingDialog(
    BuildContext context, {
    String? message,
    Widget? loadingWidget,
    bool barrierDismissible = false,
  }) {
    final theme = Theme.of(context);
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) => PopScope(
        canPop: barrierDismissible,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: theme.colorScheme.surface,
          alignment: Alignment.center,
          child: loadingWidget ??
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  if (message != null && message.isNotEmpty) ...[
                    const SizedBox(height: 24),
                    Text(
                      message,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
        ),
      ),
    );
  }

  static void closeLoadingDialog(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }
}
