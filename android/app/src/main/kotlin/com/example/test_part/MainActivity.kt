package com.example.test_part

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitFactory.setApiKey("1523943f-a2ae-47bc-87b5-a2dcc9f4ae5f")
        super.configureFlutterEngine(flutterEngine)
    }
}
