import 'package:flutter/material.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const SizedBox(height: 10),
                  _buildStatsRow(context),
                  const SizedBox(height: 24),
                  _buildToggleTabs(context),
                  const SizedBox(height: 24),
                  // قسم العناوين
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "العروض المتاحة",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildJobCard(
                    context,
                    title: "أنابيب فولاذية صناعية",
                    weight: "2.4 طن",
                    truckType: "شاحنة مسطحة",
                    price: "\$1,240",
                    pickup: "ميناء الإسكندرية، الرصيف 4",
                    dropoff: "مدينة 6 أكتوبر الصناعية",
                    status: "مفتوح",
                    time: "2 س 14 د",
                  ),
                  const SizedBox(height: 16),
                  _buildJobCard(
                    context,
                    title: "مواد غذائية سريعة التلف",
                    weight: "1.5 طن",
                    truckType: "تبريد",
                    price: "\$850",
                    pickup: "مركز تسويق القاهرة الطازجة",
                    dropoff: "مركز توزيع الغردقة",
                    status: "تقديم العروض",
                    time: "45 د",
                    isUrgent: true,
                  ),
                  const SizedBox(height: 80), // مساحة إضافية عشان الـ FAB
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF1A357D),
        child: const Icon(Icons.add_outlined, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.startFloat, // ليتناسب مع التصميم العربي
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?u=driver'),
          ),
          const Spacer(),
          Text(
            'WASLA',
            style: TextStyle(
              fontFamily: 'Manrope',
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(width: 15),
          Icon(Icons.menu_outlined, size: 30, color: colorScheme.onSurface),
        ],
      ),
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    return Row(
      children: [
        _buildStatCard(
          context,
          "12",
          "وظائف نشطة",
          Icons.local_shipping_outlined,
          true,
        ),
        const SizedBox(width: 16),
        _buildStatCard(
          context,
          "48",
          "عروض جديدة",
          Icons.analytics_outlined,
          false,
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String value,
    String label,
    IconData icon,
    bool isPrimary,
  ) {
    final colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isPrimary
              ? colorScheme.primary
              : Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(24),
          boxShadow: isPrimary
              ? []
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.03),
                    blurRadius: 10,
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Icon(icon, color: isPrimary ? Colors.white : colorScheme.primary),
            const SizedBox(height: 12),
            Text(
              value,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: isPrimary ? Colors.white : colorScheme.onSurface,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isPrimary ? Colors.white70 : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard(
    BuildContext context, {
    required String title,
    required String weight,
    required String truckType,
    required String price,
    required String pickup,
    required String dropoff,
    required String status,
    required String time,
    bool isUrgent = false,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(24),
        border: isUrgent
            ? Border.all(
                color: Colors.orange.withValues(alpha: 0.5),
                width: 1.5,
              )
            : null,
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.primary,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: isUrgent
                          ? Colors.orange.withValues(alpha: 0.1)
                          : Colors.blue.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(
                        fontSize: 11,
                        color: isUrgent ? Colors.orange : Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$weight • $truckType",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildLocationLine(context, pickup, dropoff),
          const SizedBox(height: 20),
          const Divider(height: 1),
          const SizedBox(height: 15),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A357D),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(120, 44),
                ),
                child: const Text("عرض التفاصيل"),
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.access_time_outlined,
                    color: Colors.orange,
                    size: 16,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationLine(
    BuildContext context,
    String pickup,
    String dropoff,
  ) {
    return Column(
      children: [
        _locationRow(pickup, Icons.circle_outlined, Colors.blue),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            margin: const EdgeInsets.only(right: 9),
            width: 1.5,
            height: 20,
            color: Colors.grey.withValues(alpha: 0.3),
          ),
        ),
        _locationRow(dropoff, Icons.location_on_outlined, Colors.green),
      ],
    );
  }

  Widget _locationRow(String text, IconData icon, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            text,
            textAlign: TextAlign.right,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 10),
        Icon(icon, color: color, size: 18),
      ],
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 10,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
      unselectedLabelStyle: const TextStyle(fontSize: 12),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          activeIcon: Icon(Icons.explore_outlined),
          label: "بالقرب مني",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          activeIcon: Icon(Icons.account_balance_wallet_outlined),
          label: "عروضي",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_shipping_outlined),
          activeIcon: Icon(Icons.local_shipping_outlined),
          label: "نشط",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outlined),
          activeIcon: Icon(Icons.person_outlined),
          label: "حسابي",
        ),
      ],
    );
  }

  Widget _buildToggleTabs(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isDark ? Colors.white10 : Colors.grey.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(child: _tabItem(context, "مكتمل", false)),
          Expanded(child: _tabItem(context, "نشط", true)),
        ],
      ),
    );
  }

  Widget _tabItem(BuildContext context, String label, bool isActive) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isActive
            ? (isDark ? colorScheme.primary : Colors.white)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: (isActive && !isDark)
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 5,
                ),
              ]
            : [],
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            color: isActive
                ? (isDark ? Colors.white : colorScheme.primary)
                : Colors.grey,
          ),
        ),
      ),
    );
  }
}
