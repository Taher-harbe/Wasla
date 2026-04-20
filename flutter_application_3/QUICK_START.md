# 🚀 دليل التشغيل السريع

## ✅ الحل المطبق

تم **تعطيل الخطوط مؤقتاً** في `pubspec.yaml` لتتمكن من تشغيل التطبيق فوراً.

## 🎯 التشغيل الآن

```bash
flutter pub get
flutter run
```

التطبيق سيعمل الآن باستخدام الخطوط الافتراضية للنظام.

## 📝 لتفعيل الخطوط المخصصة لاحقاً

### الخطوة 1: تنزيل الخطوط

**خط Manrope:**
1. اذهب إلى: https://fonts.google.com/specimen/Manrope
2. اضغط "Download family"
3. استخرج الملفات التالية إلى `assets/fonts/`:
   - `Manrope-Regular.ttf`
   - `Manrope-Medium.ttf`
   - `Manrope-SemiBold.ttf`
   - `Manrope-Bold.ttf`

**خط Inter:**
1. اذهب إلى: https://fonts.google.com/specimen/Inter
2. اضغط "Download family"
3. استخرج الملفات التالية إلى `assets/fonts/`:
   - `Inter-Regular.ttf`
   - `Inter-Medium.ttf`
   - `Inter-SemiBold.ttf`
   - `Inter-Bold.ttf`

### الخطوة 2: تفعيل الخطوط في pubspec.yaml

افتح `pubspec.yaml` وأزل التعليق (#) من قسم fonts:

```yaml
flutter:
  uses-material-design: true
  
  # أزل التعليق من هذا القسم:
  fonts:
    - family: Manrope
      fonts:
        - asset: assets/fonts/Manrope-Regular.ttf
        - asset: assets/fonts/Manrope-Medium.ttf
          weight: 500
        - asset: assets/fonts/Manrope-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Manrope-Bold.ttf
          weight: 700
    - family: Inter
      fonts:
        - asset: assets/fonts/Inter-Regular.ttf
        - asset: assets/fonts/Inter-Medium.ttf
          weight: 500
        - asset: assets/fonts/Inter-SemiBold.ttf
          weight: 600
        - asset: assets/fonts/Inter-Bold.ttf
          weight: 700
```

### الخطوة 3: إعادة التشغيل

```bash
flutter pub get
flutter run
```

## 🎨 الفرق

- **بدون الخطوط المخصصة:** يستخدم خطوط النظام الافتراضية (Roboto على Android، San Francisco على iOS)
- **مع الخطوط المخصصة:** يستخدم Manrope للعناوين و Inter للنصوص (مظهر أكثر احترافية)

## ⚡ ملاحظة

التطبيق يعمل بشكل كامل بدون الخطوط المخصصة. إضافة الخطوط هي فقط لتحسين المظهر البصري.
