# دليل الأيقونات - Icons Guide

## الأيقونات الحالية (Material Icons)

حالياً يستخدم التطبيق أيقونات Material Design الأساسية:

### في SplashScreen:
- `Icons.local_shipping` - أيقونة الشاحنة (الشعار)

### في RoleSelectionScreen:
- `Icons.local_shipping` - شعار التطبيق في الأعلى
- `Icons.person_pin_circle_outlined` - أيقونة العميل/صاحب البضاعة
- `Icons.local_shipping_outlined` - أيقونة السائق
- `Icons.arrow_forward_ios` - سهم التنقل

## ترقية الأيقونات إلى SVG (اختياري)

لإضافة طابع احترافي أكثر، يمكنك استبدال الأيقونات بملفات SVG مخصصة:

### الخطوات:
1. قم بإضافة حزمة `flutter_svg` في `pubspec.yaml`:
   ```yaml
   dependencies:
     flutter_svg: ^2.0.0
   ```

2. أنشئ مجلد `assets/icons/` وضع فيه ملفات SVG

3. أضف المسار في `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/icons/
   ```

4. استبدل الأيقونات في الكود:
   ```dart
   // بدلاً من:
   Icon(Icons.local_shipping, size: 48)
   
   // استخدم:
   SvgPicture.asset('assets/icons/truck.svg', width: 48, height: 48)
   ```

### الأيقونات المقترحة للتصميم:
- `truck.svg` - شعار الشاحنة الرئيسي
- `client.svg` - أيقونة العميل/صاحب البضاعة
- `driver.svg` - أيقونة السائق
- `arrow.svg` - سهم التنقل

### مصادر الأيقونات المجانية:
- [Heroicons](https://heroicons.com/)
- [Feather Icons](https://feathericons.com/)
- [Iconoir](https://iconoir.com/)
- [Phosphor Icons](https://phosphoricons.com/)

## ملاحظات التصميم

- احرص على أن تكون الأيقونات بنفس الأسلوب (Outline أو Filled)
- استخدم ألوان الثيم الأساسية (#00236F للأزرق، #006C49 للأخضر)
- حافظ على الأحجام المتناسقة (48px للشعار، 28px للأيقونات الداخلية)
