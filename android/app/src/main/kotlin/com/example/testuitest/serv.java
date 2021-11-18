package com.example.testuitest;

import android.app.NotificationManager;
import android.app.Service;
import android.content.Intent;
import android.os.Build;
import android.os.IBinder;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.core.app.NotificationCompat;

import io.flutter.plugin.common.MethodChannel;

public class serv  extends Service {
    

    @Override
    public void onCreate() {
        super.onCreate();
        if (Build.VERSION.SDK_INT>=Build.VERSION_CODES.O)
        {
            NotificationManager manager=getSystemService(NotificationManager.class);
            NotificationCompat.Builder builder=new NotificationCompat.Builder(this,"mes");
            builder.setContentText("لطفا صبر کنید");
            builder.setContentTitle("اتیران کینگ");
            builder.setSmallIcon(R.drawable.launch_background);
            startForeground(101,builder.build());
        }


        


        Toast.makeText(this, "Started", Toast.LENGTH_SHORT).show();


//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,"com.example.testuitest")
//                .setMethodCallHandler { call, result ->
//            if (call.method.equals("startService"))
//            {
//                startService()
//                result.success("Service Started")
//            }
//        }

    }


    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {


        Toast.makeText(this, "Started   2", Toast.LENGTH_SHORT).show();

        return super.onStartCommand(intent, flags, startId);

    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
