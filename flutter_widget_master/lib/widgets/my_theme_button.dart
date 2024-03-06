import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';

import './my_app_theme.dart';

class MyThemeButton extends StatelessWidget {
  const MyThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Provider.of<MyAppTheme>(context, listen: false).toggleTheme();
      },
      icon: AnimatedBuilder(
        animation: Provider.of<MyAppTheme>(context).isDarkMode
            ? Tween<double>(begin: 0, end: 0.5).animate(
                CurvedAnimation(
                  curve: Curves.easeInOut,
                  parent: const AlwaysStoppedAnimation<double>(1),
                ),
              )
            : Tween<double>(begin: 0.5, end: 1).animate(CurvedAnimation(
                curve: Curves.easeInOut,
                parent: const AlwaysStoppedAnimation<double>(1),
              )),
        builder: (context, child) {
          return Transform.rotate(
            angle: Provider.of<MyAppTheme>(context).isDarkMode
                ? Tween<double>(begin: 0, end: 0.5)
                        .animate(CurvedAnimation(
                          curve: Curves.easeInOut,
                          parent: const AlwaysStoppedAnimation<double>(1),
                        ))
                        .value *
                    2 *
                    3.14159265359
                : Tween<double>(begin: 0.5, end: 1)
                        .animate(CurvedAnimation(
                          curve: Curves.easeInOut,
                          parent: const AlwaysStoppedAnimation<double>(1),
                        ))
                        .value *
                    2 *
                    3.14159265359,
            child: child,
          );
        },
        child: Icon(
          Provider.of<MyAppTheme>(context).isDarkMode
              ? LucideIcons.moon
              : LucideIcons.sun,
        ),
      ),
    );
  }
}
