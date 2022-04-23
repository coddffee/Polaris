package com.coddffee.polaris.urlmap;

import com.coddffee.polaris.R;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class AMapUrlConnection {
    private AMapUrl aMapUrl;
    private HttpURLConnection connection = null;
    private InputStream inputStream = null;

    public AMapUrlConnection(AMapUrl aMapUrl) {
        this.aMapUrl = aMapUrl;
    }

    /* 连接高德地图静态地图服务器并且请求数据，耗时方法，应当开辟一条线程调用防止阻塞UI */
    public InputStream connectAndRequestLocate(int connectTimeout, int readTimeout) {
        try{
            connection = (HttpURLConnection) new URL(aMapUrl.getUrl()).openConnection();
            connection.setConnectTimeout(connectTimeout);
            connection.setReadTimeout(readTimeout);
            connection.setRequestMethod("GET");
            connection.connect();
            inputStream = connection.getInputStream();
            return inputStream;
        } catch (Exception e) {
            AMapUrlConnection.this.disconnect();
        }
        return null;
    }

    public void disconnect() {
        try{
            if(connection != null) connection.disconnect();
            if(inputStream != null) inputStream.close();
        } catch (Exception e) {
        }
    }

}
