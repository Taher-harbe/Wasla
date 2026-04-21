import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class AddOrderScreen extends StatefulWidget {
  const AddOrderScreen({super.key});

  @override
  State<AddOrderScreen> createState() => _AddOrderScreenState();
}

class _AddOrderScreenState extends State<AddOrderScreen> {
  // المتحكمات
  final MapController _pickupMapController = MapController();
  final MapController _destinationMapController = MapController();
  final TextEditingController _pickupAddressController =
      TextEditingController();
  final TextEditingController _destinationAddressController =
      TextEditingController();

  // الإحداثيات (القاهرة كبداية)
  LatLng _pickupPoint = const LatLng(30.0444, 31.2357);
  LatLng _destinationPoint = const LatLng(30.0131, 31.2089);
  bool _isLoading = false;

  // دالة البحث (تتوافق مع المتصفح والموبايل)
  Future<void> _searchAddress(String address, bool isPickup) async {
    if (address.isEmpty) return;
    setState(() => _isLoading = true);
    try {
      final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=${address.trim()}, Egypt&format=json&limit=1',
      );
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        if (data.isNotEmpty) {
          LatLng newPos = LatLng(
            double.parse(data[0]['lat']),
            double.parse(data[0]['lon']),
          );
          setState(() {
            if (isPickup) {
              _pickupPoint = newPos;
              _pickupMapController.move(newPos, 15.0);
            } else {
              _destinationPoint = newPos;
              _destinationMapController.move(newPos, 15.0);
            }
          });
        }
      }
    } catch (e) {
      debugPrint("Search Error: $e");
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // تحديد إذا كان الثيم داكن بناءً على اختيارك في الصور
    final bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_outlined),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'طلب نقل جديد',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildWarningBanner(),
                const SizedBox(height: 24),

                _buildSectionHeader("الخطوة 01", "تفاصيل الاستلام"),
                _buildMapContainer(
                  label: "عنوان الاستلام",
                  hint: "اكتب المدينة أو القرية (مثلاً: ديرب نجم)",
                  currentPoint: _pickupPoint,
                  mapController: _pickupMapController,
                  textController: _pickupAddressController,
                  onSearch: () =>
                      _searchAddress(_pickupAddressController.text, true),
                  onTap: (point) => setState(() => _pickupPoint = point),
                ),

                const SizedBox(height: 32),

                _buildSectionHeader("الخطوة 02", "تفاصيل التسليم"),
                _buildMapContainer(
                  label: "عنوان التسليم",
                  hint: "إلى أين ستذهب الشحنة؟",
                  currentPoint: _destinationPoint,
                  mapController: _destinationMapController,
                  textController: _destinationAddressController,
                  onSearch: () =>
                      _searchAddress(_destinationAddressController.text, false),
                  onTap: (point) => setState(() => _destinationPoint = point),
                ),

                const SizedBox(height: 32),

                _buildSectionHeader("الخطوة 03", "معلومات الشحنة"),
                _buildCargoDescriptionCard(isDark),

                const SizedBox(height: 40),
                _buildPublishButton(),
                const SizedBox(height: 20),
              ],
            ),
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF1A357D)),
            ),
        ],
      ),
    );
  }

  // ميثود بناء الخريطة بنفس ستايل الصور السابقة
  Widget _buildMapContainer({
    required String label,
    required String hint,
    required LatLng currentPoint,
    required MapController mapController,
    required TextEditingController textController,
    required VoidCallback onSearch,
    required Function(LatLng) onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 12),
        Container(
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isDark ? const Color(0xFF404040) : Colors.grey.shade300,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: currentPoint,
                initialZoom: 13.0,
                onTap: (tapPosition, point) => onTap(point),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.taher.wasla',
                  // تطبيق فلتر الخريطة الداكنة إذا كان الثيم داكناً كما في صورك
                  tileBuilder: isDark ? _darkMapFilter : null,
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: currentPoint,
                      child: const Icon(
                        Icons.location_on_rounded,
                        color: Color(0xFF1A357D),
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: isDark ? Colors.grey : Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: textController,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: onSearch,
            ),
          ),
          onSubmitted: (value) => onSearch(),
        ),
      ],
    );
  }

  // كارت وصف الشحنة (الخطوة 3)
  Widget _buildCargoDescriptionCard(bool isDark) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? const Color(0xFF333333) : Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            "وصف الشحنة",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 12),
          TextField(
            maxLines: 4,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: "صف العناصر (مثلاً: أثاث، كراتين...)",
              fillColor: isDark
                  ? const Color(0xFF252525)
                  : const Color(0xFFF5F5F5),
            ),
          ),
        ],
      ),
    );
  }

  // فلتر لجعل الخريطة داكنة لتناسب الثيم الداكن
  Widget _darkMapFilter(
    BuildContext context,
    Widget tileWidget,
    TileImage tile,
  ) {
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix([
        -0.9,
        0,
        0,
        0,
        255,
        0,
        -0.9,
        0,
        0,
        255,
        0,
        0,
        -0.9,
        0,
        255,
        0,
        0,
        0,
        1,
        0,
      ]),
      child: tileWidget,
    );
  }

  Widget _buildWarningBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.orange.withOpacity(0.5)),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Text(
              "تنبيه: سيتم نشر الطلب لجميع السائقين المتاحين.",
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.orange, fontSize: 13),
            ),
          ),
          SizedBox(width: 12),
          Icon(Icons.info_outline_rounded, color: Colors.orange),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String step, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          step,
          style: const TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildPublishButton() {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1A357D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () {},
        child: const Text(
          "نشر الطلب الآن",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
