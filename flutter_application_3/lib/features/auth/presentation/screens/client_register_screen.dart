// lib/features/auth/presentation/screens/client_register_screen.dart

import 'package:flutter/material.dart';

class ClientRegisterScreen extends StatelessWidget {
  const ClientRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // تحديد ما إذا كان النظام في الوضع الداكن
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      // استخدام لون الخلفية من الثيم ليدعم الدارك مود تلقائياً
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'WASLA',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'إنشاء حساب عميل',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'ابحث عن سائقين موثوقين لنقلك',
              style: TextStyle(color: Colors.grey, fontFamily: 'Inter'),
            ),
            const SizedBox(height: 40),

            _buildFieldLabel("الاسم الكامل"),
            _buildTextField(context, hint: 'محمد علي'),

            const SizedBox(height: 20),
            _buildFieldLabel("البريد الإلكتروني"),
            _buildTextField(context, hint: 'name@example.com'),

            const SizedBox(height: 20),
            _buildFieldLabel("رقم الهاتف"),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    // تغيير لون خلفية كود الدولة في الدارك مود
                    color: isDark ? Colors.white10 : const Color(0xFFF4F3FA),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    '+20',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: _buildTextField(context, hint: '123 456 7890')),
              ],
            ),

            const SizedBox(height: 20),
            _buildFieldLabel("كلمة المرور"),
            _buildTextField(context, hint: '********', isPassword: true),

            const SizedBox(height: 20),
            _buildFieldLabel("تأكيد كلمة المرور"),
            _buildTextField(context, hint: '********', isPassword: true),

            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                backgroundColor: colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text(
                'إنشاء الحساب',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldLabel(String label) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0, right: 4),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    BuildContext context, {
    required String hint,
    bool isPassword = false,
  }) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return TextField(
      obscureText: isPassword,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        filled: true,
        // تغيير لون الحقل ليكون داكناً في الدارك مود
        fillColor: isDark ? Colors.white10 : const Color(0xFFF4F3FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
