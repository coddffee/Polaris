package com.coddffee.polaris.utils;

import android.app.Activity;
import android.view.View;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

public class AndroidUtils {
    public static void HideStatusBar(Activity activity) {
        /* 隐藏状态栏 */
        View decorView = activity.getWindow().getDecorView();
        /* Hide the status bar. */
        int uiOptions = View.SYSTEM_UI_FLAG_FULLSCREEN;
        decorView.setSystemUiVisibility(uiOptions);
        /* Remember that you should never show the action bar if the status bar is hidden,
           so hide that too if necessary. */
        ActionBar actionBar = ((AppCompatActivity)(activity)).getSupportActionBar();
        actionBar.hide();
    }
}
