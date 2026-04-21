import 'package:flutter/material.dart';

class DriverRegisterScreen extends StatefulWidget {
  const DriverRegisterScreen({super.key});

  @override
  State<DriverRegisterScreen> createState() => _DriverRegisterScreenState();
}

class _DriverRegisterScreenState extends State<DriverRegisterScreen> {
  String? _selectedVehicle;

  final List<Map<String, String>> _vehicleTypes = [
    {"value": "PICKUP", "label": "نصف نقل (بيك أب - 1 طن)"},
    {"value": "JUMBO", "label": "جامبو مكشوفة"},
    {"value": "DABABA", "label": "سيارة ربع نقل (دبابة)"},
    {"value": "HEAVY", "label": "شاحنة نقل ثقيل (تريلا)"},
  ];

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
            const SizedBox(height: 24),
            Text(
              'إنشاء حساب سائق',
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontSize: 32),
            ),
            const SizedBox(height: 32),

            const TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'الاسم الكامل',
                suffixIcon: Icon(Icons.person_outlined),
              ),
            ),
            const SizedBox(height: 16),

            const TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'البريد الإلكتروني',
                suffixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: 16),

            const TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'رقم الهاتف',
                suffixIcon: Icon(Icons.phone_outlined),
              ),
            ),
            const SizedBox(height: 16),

            const TextField(
              obscureText: true,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'كلمة المرور',
                suffixIcon: Icon(Icons.lock_outlined),
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 24),

            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'تفاصيل المركبة',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            const SizedBox(height: 16),

            _buildDropdownField(
              context,
              'نوع المركبة',
              Icons.local_shipping_outlined,
            ),
            const SizedBox(height: 16),

            const TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'لوحة الترخيص',
                suffixIcon: Icon(Icons.assignment_outlined),
              ),
            ),
            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {
                // الانتقال لشاشة السائق الرئيسية بعد التسجيل
                Navigator.pushReplacementNamed(context, '/driver-home');
              },
              child: const Text('إنشاء الحساب'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownField(BuildContext context, String hint, IconData icon) {
    return Container(
      width: double.infinity,
      height: 55,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).inputDecorationTheme.fillColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: _selectedVehicle,
          hint: Align(
            alignment: Alignment.centerRight,
            child: Text(
              hint,
              style: TextStyle(
                color:
                    Theme.of(context).inputDecorationTheme.hintStyle?.color ??
                    Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
          items: _vehicleTypes
              .map(
                (v) => DropdownMenuItem(
                  value: v['value'],
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      v['label']!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (val) => setState(() => _selectedVehicle = val),
        ),
      ),
    );
  }
}
