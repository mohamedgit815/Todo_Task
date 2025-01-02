import 'package:flutter/material.dart';

class GlobalContext {

  ({
    bool isDark,
    bool keyBoard,
    MediaQueryData mediaQ,
    ThemeData theme,
    double height
  }) context(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    bool keyBoard = MediaQuery.of(context).viewInsets.bottom == 0;
    final MediaQueryData mediaQ = MediaQuery.of(context);
    final ThemeData theme = Theme.of(context);
    final double height = MediaQuery.of(context).size.height - AppBar().preferredSize.height;

    return (isDark: isDark, keyBoard: keyBoard, mediaQ: mediaQ, theme: theme, height: height);
  }

}