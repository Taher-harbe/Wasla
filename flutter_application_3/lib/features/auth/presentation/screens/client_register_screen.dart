// lib/features/auth/presentation/screens/client_register_screen.dart

import 'package:flutter/material.dart';

class ClientRegisterScreen extends StatelessWidget {
  const ClientRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'WASLA',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'إنشاء حساب عميل',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontSize: 32),
            ),
            Text(
              'ابحث عن سائقين موثوقين لنقلك',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontFamily: 'Inter',
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 40),

            _buildFieldLabel("الاسم الكامل"),
            const TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(hintText: 'محمد علي'),
            ),

            const SizedBox(height: 20),
            _buildFieldLabel("البريد الإلكتروني"),
            const TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(hintText: 'name@example.com'),
            ),

            const SizedBox(height: 20),
            _buildFieldLabel("رقم الهاتف"),
            Row(
              children: [
                Container(
                  height: 55,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).inputDecorationTheme.fillColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    '+20',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                const SizedBox(width: 12),
                const Expanded(
                  child: TextField(
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(hintText: '123 456 7890'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            _buildFieldLabel("كلمة المرور"),
            const TextField(
              obscureText: true,
              textAlign: TextAlign.right,
              decoration: InputDecoration(hintText: '********'),
            ),

            const SizedBox(height: 20),
            _buildFieldLabel("تأكيد كلمة المرور"),
            const TextField(
              obscureText: true,
              textAlign: TextAlign.right,
              decoration: InputDecoration(hintText: '********'),
            ),

            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // الانتقال لشاشة العميل الرئيسية بعد التسجيل
                Navigator.pushReplacementNamed(context, '/client-home');
              },
              child: const Text('إنشاء الحساب'),
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
        padding: const EdgeInsets.only(bottom: 12.0, right: 4),
        child: Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
