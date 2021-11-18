package com.example.testuitest

import android.content.Intent
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    var inte:Intent ?=null
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        inte= Intent(this,serv::class.java)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,"com.example.testuitest")
            .setMethodCallHandler { call,result ->
                if (call.method.equals("startService"))
                {
                    startService()
                    result.success("Service Started")
                }
            }
    }
    fun  startService() {
        if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.O)
        {
            startForegroundService(inte);
        }else{
            startService(inte)
        }
    }
}
