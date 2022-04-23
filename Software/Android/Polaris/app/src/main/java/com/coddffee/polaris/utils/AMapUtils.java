package com.coddffee.polaris.utils;

import android.content.Context;
import android.os.RemoteException;

import com.amap.api.interfaces.MapCameraMessage;
import com.amap.api.maps2d.AMap;
import com.amap.api.maps2d.CameraUpdate;
import com.amap.api.maps2d.CameraUpdateFactory;
import com.amap.api.maps2d.MapsInitializer;
import com.amap.api.maps2d.model.CameraPosition;
import com.amap.api.maps2d.model.LatLng;

public class AMapUtils {
    public static void initializeAMapSDK(Context context) {
        try {
            MapsInitializer.initialize(context);
            MapsInitializer.setApiKey("4b73d97d8e9d081c13b927aa0cdd8e6d");
            MapsInitializer.setNetworkEnable(true);
        } catch (RemoteException e) {
            e.printStackTrace();
        }
    }
    public static void locate(AMap aMap, double x, double y, float zoom) {
        CameraPosition position = new CameraPosition(new LatLng(x,y),zoom,0f,0f);
        CameraUpdate cameraUpdate = CameraUpdateFactory.newCameraPosition(position);
        aMap.moveCamera(cameraUpdate);
    }
}
