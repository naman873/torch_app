package com.naman.discolight

import android.os.Bundle
import android.provider.Settings
import android.content.ContentResolver
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

import android.os.Build
import android.content.Intent
import android.net.Uri
import android.widget.Toast

class MainActivity : FlutterActivity() {
    private val CHANNEL = "custom_brightness"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        MethodChannel(flutterEngine!!.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "setFullBrightness") {
                setFullBrightness()
                result.success(null) // Send success response to Flutter
            }
            if(call.method=="setLowBrightness"){
                setLowBrightness()
                result.success(null)
            }
            else {
                result.notImplemented() // If method isn't recognized
            }
        }
    }

    private fun setFullBrightness() {
        val layoutParams = window.attributes
        layoutParams.screenBrightness = 1f  // 1f = full brightness, range is 0f to 1f
        window.attributes = layoutParams
    }

    private fun setLowBrightness() {
        val layoutParams = window.attributes
        layoutParams.screenBrightness = 0.2f
        window.attributes = layoutParams
    }
}
