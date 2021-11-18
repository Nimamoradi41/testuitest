package com.example.testuitest

import android.app.NotificationChannel
import android.app.NotificationManager
import android.os.Build
import io.flutter.app.FlutterApplication

class MyApplication : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()



        if(Build.VERSION.SDK_INT>=Build.VERSION_CODES.O)
        {
            var notif=NotificationChannel("mes","mes",NotificationManager.IMPORTANCE_HIGH);
            var notifmna=getSystemService(NotificationManager::class.java)
            notifmna.createNotificationChannel(notif)
        }
    }
}