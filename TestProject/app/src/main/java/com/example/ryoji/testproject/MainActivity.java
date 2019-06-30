package com.example.ryoji.testproject;

import android.content.Intent;
import android.provider.Settings;
import android.support.v4.app.NotificationManagerCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;

import java.util.Set;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Set<String> test = NotificationManagerCompat.getEnabledListenerPackages(this);
        if (!NotificationManagerCompat.getEnabledListenerPackages(this).contains("com.example.ryoji.testproject")) {

            Intent i = new Intent(Settings.ACTION_NOTIFICATION_LISTENER_SETTINGS);
            startActivity(i);

        } else {
            Intent i = new Intent(getApplication(), NotificationService.class);
            startService(i);
        }
    }
}
