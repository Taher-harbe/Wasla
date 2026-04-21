import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startNavigationTimer();
  }

  // منطق الانتقال التلقائي (Logic)
  void _startNavigationTimer() {
    Timer(const Duration(seconds: 3), () {
      // هنا سيتم فحص الـ Token لاحقاً
      // حالياً سننتقل لشاشة اختيار الدور (Role Selection)
      Navigator.pushReplacementNamed(context, '/role-selection');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary, // الخلفية الزرقاء
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // الشعار داخل دائرة بيضاء كما في الصورة
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.local_shipping_outlined,
                    size: 60,
                    color: Color(0xFF1A357D),
                  ),
                ),
                const SizedBox(height: 24),
                // اسم التطبيق بخط Manrope
                const Text(
                  'وصلة',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 42,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'WASLA',
                  style: TextStyle(
                    fontFamily: 'Manrope',
                    fontSize: 24,
                    color: Color(0xFF9BA7C1),
                    letterSpacing: 4,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'الموجه الدقيق للملاحة',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          // مؤشر التحميل الأخضر في الأسفل
          const Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: CircularProgressIndicator(
                color: Color(0xFF006C49), // الـ Secondary Green
              ),
            ),
          ),
        ],
      ),
    );
  }
}
