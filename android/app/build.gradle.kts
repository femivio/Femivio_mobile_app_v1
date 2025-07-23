plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // ✅ Flutter plugin must come last
}

android {
    namespace = "com.example.femivio_project"
    compileSdk = 35                           // ✅ Explicit SDK version
    ndkVersion = "27.0.12077973"              // ✅ REQUIRED to fix NDK version mismatch

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = "11"
    }

    defaultConfig {
        applicationId = "com.example.femivio_project"
        minSdk = 21                            // ✅ Minimum SDK for Flutter
        targetSdk = 35
        versionCode = 1
        versionName = "1.0"
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
