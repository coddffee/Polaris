package com.coddffee.polaris;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import androidx.appcompat.app.AppCompatActivity;

import com.amap.api.maps2d.AMap;
import com.amap.api.maps2d.MapView;
import com.coddffee.polaris.utils.AMapUtils;
import com.coddffee.polaris.utils.AndroidUtils;

public class MainActivity extends AppCompatActivity implements View.OnClickListener {
    private MapView mapView = null;
    private AMap aMap = null;
    private EditText locationXEditText = null;
    private EditText locationYEditText = null;
    private EditText sizeXEditText = null;
    private EditText sizeYEditText = null;
    private Button zoomUpButton = null;
    private Button zoomDnButton = null;
    private Button locateButton = null;
    private Button synchronizeButton = null;
    private double locationX;
    private double locationY;
    private float zoomLevel = 0f;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        AndroidUtils.HideStatusBar(this);
        AMapUtils.initializeAMapSDK(this);
        setContentView(R.layout.activity_main);
        //获取地图控件引用
        mapView = (MapView) findViewById(R.id.mapView);
        //在activity执行onCreate时执行mMapView.onCreate(savedInstanceState)，创建地图
        mapView.onCreate(savedInstanceState);
        aMap = mapView.getMap();
        locationXEditText = findViewById(R.id.locationXEditText);
        locationYEditText = findViewById(R.id.locationYEditText);
        sizeXEditText = findViewById(R.id.sizeXEditText);
        sizeYEditText = findViewById(R.id.sizeYEditText);
        zoomUpButton = findViewById(R.id.zoomUpButton);
        zoomDnButton = findViewById(R.id.zoomDnButton);
        locateButton = findViewById(R.id.locateButton);
        synchronizeButton = findViewById(R.id.synchronizeButton);
        zoomUpButton.setOnClickListener(this);
        zoomDnButton.setOnClickListener(this);
        locateButton.setOnClickListener(this);
        synchronizeButton.setOnClickListener(this);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        //在activity执行onDestroy时执行mMapView.onDestroy()，销毁地图
        mapView.onDestroy();
    }
    @Override
    protected void onResume() {
        super.onResume();
        //在activity执行onResume时执行mMapView.onResume ()，重新绘制加载地图
        mapView.onResume();
    }
    @Override
    protected void onPause() {
        super.onPause();
        //在activity执行onPause时执行mMapView.onPause ()，暂停地图的绘制
        mapView.onPause();
    }
    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        //在activity执行onSaveInstanceState时执行mMapView.onSaveInstanceState (outState)，保存地图当前的状态
        mapView.onSaveInstanceState(outState);
    }

    @Override
    public void onClick(View view) {
        if(view == zoomUpButton) {
            if(zoomLevel < aMap.getMaxZoomLevel()) zoomLevel += 1f;
            AMapUtils.locate(aMap,locationX,locationY, zoomLevel);
        }
        else if(view == zoomDnButton) {
            if(zoomLevel > aMap.getMinZoomLevel()) zoomLevel -= 1f;
            AMapUtils.locate(aMap,locationX,locationY, zoomLevel);
        }
        else if(view == locateButton) {
            if(locationXEditText.getText().toString().equals("") || locationYEditText.getText().toString().equals("")) return;
            locationX = new Double(locationXEditText.getText().toString());
            locationY = new Double(locationYEditText.getText().toString());
            AMapUtils.locate(aMap,locationX,locationY, zoomLevel);
        }
        else if(view == synchronizeButton) {

        }
    }
}