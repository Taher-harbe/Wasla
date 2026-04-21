// lib/features/auth/presentation/screens/role_selection_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/theme_controller.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Consumer<ThemeController>(
            builder: (context, themeController, child) {
              return IconButton(
                onPressed: themeController.toggleTheme,
                icon: Icon(
                  themeController.themeIcon,
                  color: colorScheme.primary,
                ),
                tooltip: 'Toggle Theme',
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // الجزء العلوي: العنوان والشعار
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
          const SizedBox(height: 8),
          const Text(
            'الملاح الدقيق للخدمات اللوجستية الحديثة',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          const SizedBox(height: 40),

          // الكروت (الخيارات)
          _buildRoleCard(
            context,
            title: "أحتاج لنقل شيء ما",
            subtitle:
                "انشر طلباً واحصل على عروض من سائقين موثوقين في جميع أنحاء البلاد.",
            icon: Icons.inventory_2_outlined,
            onTap: () => Navigator.pushNamed(context, '/register/client'),
          ),
          const SizedBox(height: 20),
          _buildRoleCard(
            context,
            title: "أنا سائق شاحنة",
            subtitle:
                "ابحث عن وظائف بالقرب منك وقم بزيادة أرباحك من خلال التوجيه الذكي.",
            icon: Icons.local_shipping_outlined,
            onTap: () => Navigator.pushNamed(context, '/register/driver'),
          ),

          // مساحة مرنة تدفع الـ Footer لأسفل
          const Spacer(),

          // الجزء السفلي: رابط تسجيل الدخول
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/login'),
                  child: Text(
                    ' تسجيل الدخول',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Text(
                  ' لديك حساب بالفعل؟',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(24),
          boxShadow: isDark
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
        ),
        child: Row(
          children: [
            // أيقونة السهم جهة اليسار - استخدام outlined version
            Icon(
              Icons.arrow_back_outlined,
              color: Theme.of(context).colorScheme.primary,
              size: 20,
            ),
            const Spacer(),
            // النصوص جهة اليمين
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // أيقونة الدور داخل دائرة
            CircleAvatar(
              radius: 24,
              backgroundColor: Theme.of(
                context,
              ).colorScheme.primary.withValues(alpha: 0.1),
              child: Icon(icon, color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
