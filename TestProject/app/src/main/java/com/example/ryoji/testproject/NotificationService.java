package com.example.ryoji.testproject;

import android.service.notification.NotificationListenerService;
import android.service.notification.StatusBarNotification;

public class NotificationService extends NotificationListenerService {
    private String TAG = "Notification";

    @Override
    public void onCreate() {
        super.onCreate();
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
    }

    @Override
    public void onNotificationPosted(StatusBarNotification sbn) {
        //通知が更新
    }

    @Override
    public void onNotificationRemoved(StatusBarNotification sbn) {
        //通知が削除
    }
}
