# ===== Flutter Core =====
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.view.** { *; }

# Plugin interfaces
-keep class * implements io.flutter.plugin.common.PluginRegistry$PluginRegistrantCallback { *; }
-keep class * implements io.flutter.plugin.common.MethodCallHandler { *; }
-keep class * implements io.flutter.plugin.common.EventChannel$StreamHandler { *; }
-keep class * implements io.flutter.embedding.engine.plugins.FlutterPlugin { *; }
-keep class * implements io.flutter.embedding.engine.plugins.activity.ActivityAware { *; }
-keep class * implements io.flutter.embedding.engine.plugins.lifecycle.FlutterLifecycleListener { *; }

# ===== Firebase =====
-keep class com.google.firebase.** { *; }
-keep class com.google.firebase.messaging.** { *; }
-keep class com.google.firebase.firestore.** { *; }
-keep class com.google.firebase.auth.** { *; }
-keep class com.google.protobuf.** { *; }  # For Firestore
-dontwarn com.google.firebase.**

# ===== Google Sign-In =====
-keep class com.google.android.gms.auth.** { *; }
-keep class com.google.android.gms.tasks.** { *; }

# ===== Image Picker =====
-keep class io.flutter.plugins.imagepicker.** { *; }

# ===== Shared Preferences =====
-keep class io.flutter.plugins.sharedpreferences.** { *; }

# ===== HTTP/Dio =====
-keep class com.example.yourpackage.network.** { *; }  # Replace with your package
-keep class * extends retrofit2.CallAdapter.Factory { *; }  # For Dio

# ===== Flutter Local Notifications =====
-keep class com.dexterous.flutterlocalnotifications.** { *; }

# ===== File Picker =====
-keep class com.mr.flutter.plugin.filepicker.** { *; }

# ===== Permission Handler =====
-keep class com.baseflow.permissionhandler.** { *; }

# ===== General Optimizations =====
-keepattributes Signature, *Annotation*
-keepclasseswithmembers class * { native <methods>; }
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}

# ===== Web/JS (for flutter_web_plugins) =====
-keep class **.web.** { *; }
-dontwarn org.apache.http.**


# Play Core for deferred components
-keep class com.google.android.play.core.** { *; }
-keep class com.google.android.play.core.install.** { *; }
-keep class com.google.android.play.core.splitinstall.** { *; }
-keep class com.google.android.play.core.tasks.** { *; }
-dontwarn com.google.android.play.core.**