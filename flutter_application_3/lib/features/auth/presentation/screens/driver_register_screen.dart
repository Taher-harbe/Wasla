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
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
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
            const Text(
              'إنشاء حساب سائق',
              style: TextStyle(
                fontFamily: 'Manrope',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            _buildTextField(
              context,
              hint: 'الاسم الكامل',
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              context,
              hint: 'البريد الإلكتروني',
              icon: Icons.email_outlined,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              context,
              hint: 'رقم الهاتف',
              icon: Icons.phone_outlined,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              context,
              hint: 'كلمة المرور',
              icon: Icons.lock_outline,
              isPassword: true,
            ),
            const SizedBox(height: 24),
            const Divider(),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'تفاصيل المركبة',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            _buildDropdownField(
              context,
              'نوع المركبة',
              Icons.local_shipping_outlined,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              context,
              hint: 'لوحة الترخيص',
              icon: Icons.featured_play_list_outlined,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // الانتقال لشاشة السائق الرئيسية بعد التسجيل
                Navigator.pushReplacementNamed(context, '/driver-home');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 56),
                backgroundColor: Theme.of(context).colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
              child: const Text(
                'إنشاء الحساب',
                style: TextStyle(
                  color: Colors.white,
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

  Widget _buildTextField(
    BuildContext context, {
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: Icon(icon, color: Colors.grey),
        filled: true,
        fillColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.white10
            : const Color(0xFFF4F3FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildDropdownField(BuildContext context, String hint, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white10
            : const Color(0xFFF4F3FA),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: _selectedVehicle,
          hint: Align(
            alignment: Alignment.centerRight,
            child: Text(hint, style: const TextStyle(color: Colors.grey)),
          ),
          items: _vehicleTypes
              .map(
                (v) => DropdownMenuItem(
                  value: v['value'],
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(v['label']!),
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
