# 高德地图API使用笔记

## 获取API-Key

&emsp;&emsp;API-Key是使用高德地图API时必须使用的密钥，可在高德地图开发者控制台上通过创建一个新应用的方式获取API-Key, 一个Key只能用于一个应用的开发。创建应用之前需要在AndroidStudio中获取发布版安全码SHA1和调试版安全码SHA1及应用Package.

### 获取SHA1

```xxx
1.将JDK自带的keytool添加至环境变量(将JDK安装目录下的bin路径添加至环境变量即可)
2.在AndroidStudio下创建keystore:
  (1)依次点击Build->Generate Signed Bundle / APK
  (2)选择存储路径并输入keystore名和密码
  (3)选择keystore的应用目标(debug/release或者两者均是)
3.获取SHA1:
  (1)打开终端并切换到步骤2生成的keystore所在的目录下
  (2)输入命令"keytool -list -v -keystore xxx.jks","xxx.jks"为keystore文件名，新版AndroidStudio的keystore后缀为.jks
  (3)输入步骤2中生成keystore时设置的密码
  (4)在返回信息中可查看SHA1
```

### 获取Package

&emsp;&emsp;即App的`AndroidManifest.xml`中的根标签的package属性。

### 创建高德地图新应用

&emsp;&emsp;在高德地图开发者控制台的应用管理中创建新应用并输入SHA1和Package即可得到对应的API-Key

### 在开发中使用API-Key

&emsp;&emsp;在`AndroidManifest.xml`的`<application>`标签中添加API-Key, 如：

```xml
<application...>
    <!-- value属性赋API-Key -->
    <meta-data
        android:name="com.amap.api.v2.apikey"
        android:value="45ebf..."/>
    ...
</application...>
```

