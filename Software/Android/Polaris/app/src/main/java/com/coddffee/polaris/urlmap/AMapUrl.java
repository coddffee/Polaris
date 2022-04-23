package com.coddffee.polaris.urlmap;

import java.nio.charset.StandardCharsets;

public class AMapUrl {
    private final String urlBase = "https://restapi.amap.com/v3/staticmap";
    private String url;
    private String apiKey;
    private double locationX;
    private double locationY;
    private int sizeXPixel;
    private int sizeYPixel;
    private int zoomLevel;

    public AMapUrl(String apiKey) {
        this.apiKey = apiKey;
    }

    public void setLocation(double x,double y) {
        this.locationX = x;
        this.locationY = y;
    }
    public void setSizePixel(int x,int y) {
        this.sizeXPixel = x;
        this.sizeYPixel = y;
    }
    public void setZoomLevel(int zoomLevel) {
        if(zoomLevel > 17) this.zoomLevel = 17;
        else if(zoomLevel < 0) this.zoomLevel = 0;
        else this.zoomLevel = zoomLevel;
    }
    public String getUrl() {
        url = urlBase
                + "?key=" + apiKey
                + "&location=" + locationX + "," + locationY
                + "&size=" + sizeXPixel + "*" + sizeYPixel
                + "&zoom=" + zoomLevel;
        url = new String(url.getBytes(StandardCharsets.UTF_8));
        return url;
    }
    public double getLocationX() {return this.locationX;}
    public double getLocationY() {return this.locationY;}
    public int getSizeXPixel() {return this.sizeXPixel;}
    public int getSizeYPixel() {return this.sizeYPixel;}
    public int getZoomLevel() {return this.zoomLevel;}
}
