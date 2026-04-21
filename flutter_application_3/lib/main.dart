import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller.dart';
import 'features/auth/presentation/screens/splash_screen.dart';
import 'features/auth/presentation/screens/role_selection_screen.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/presentation/screens/client_register_screen.dart';
import 'features/auth/presentation/screens/driver_register_screen.dart';
import 'features/home_driver/presentation/screens/driver_home_screen.dart';
import 'features/home_client/presentation/screens/client_home_screen.dart';
import 'features/home_client/presentation/screens/add_order_screen.dart';

void main() {
  runApp(const WaslaApp());
}

class WaslaApp extends StatelessWidget {
  const WaslaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: Consumer<ThemeController>(
        builder: (context, themeController, child) {
          return MaterialApp(
            title: 'Wasla',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeController.themeMode,
            initialRoute: '/',
            routes: {
              '/': (context) => const SplashScreen(),
              '/role-selection': (context) => const RoleSelectionScreen(),
              '/login': (context) => const LoginScreen(),
              '/register/client': (context) => const ClientRegisterScreen(),
              '/register/driver': (context) => const DriverRegisterScreen(),
              '/driver-home': (context) => const DriverHomeScreen(),
              '/client-home': (context) => const ClientHomeScreen(),
              '/add-order': (context) => const AddOrderScreen(),
            },
          );
        },
      ),
    );
  }
}
