# Flutter specific rules (important for plugins)
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.view.** { *; }

-keep class * implements io.flutter.plugin.common.PluginRegistry$PluginRegistrantCallback { *; }
-keep class * implements io.flutter.plugin.common.MethodCallHandler { *; }
-keep class * implements io.flutter.plugin.common.EventChannel$StreamHandler { *; }
-keep class * implements io.flutter.embedding.engine.plugins.FlutterPlugin { *; }
-keep class * implements io.flutter.embedding.engine.plugins.activity.ActivityAware { *; }
-keep class * implements io.flutter.embedding.engine.plugins.lifecycle.FlutterLifecycleAdapter { *; }

# Firebase Cloud Messaging and related
-keep class com.google.firebase.messaging.** { *; }
-keep class com.google.firebase.iid.** { *; } # Legacy but good to keep
-dontwarn com.google.firebase.messaging.**
-dontwarn com.google.firebase.iid.**

# Firebase Core and other Firebase services
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# Google Play Services (often needed for Firebase)
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**