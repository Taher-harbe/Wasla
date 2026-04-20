// lib/features/auth/presentation/screens/login_screen.dart

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // سحب ألوان الثيم الحالي
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // الرجوع للخلف باستخدام Navigator
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'WASLA',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'مرحباً بعودتك',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'ادخل إلى حسابك وتتبع رحلاتك القادمة.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 48),

            // حاوية الحقول (Card)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                // استخدام لون الكارد من الثيم
                color: Theme.of(context).cardTheme.color,
                borderRadius: BorderRadius.circular(24),
                boxShadow: isDark
                    ? []
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 20,
                        ),
                      ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end, // للمحاذاة العربية
                children: [
                  const Text(
                    'البريد الإلكتروني',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildTextField(
                    context,
                    hint: 'example@wasla.com',
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'كلمة المرور',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildTextField(
                    context,
                    hint: '********',
                    icon: Icons.lock_outline,
                    isPassword: true,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      // منطق الدخول
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                      backgroundColor: colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    child: const Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, '/role-selection'),
                          child: Text(
                            ' سجل الآن',
                            style: TextStyle(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Text(' ليس لديك حساب؟'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return TextField(
      obscureText: isPassword,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        suffixIcon: Icon(icon, color: Colors.grey), // أيقونة جهة اليمين للعربي
        filled: true,
        fillColor: isDark ? Colors.white10 : const Color(0xFFF4F3FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
