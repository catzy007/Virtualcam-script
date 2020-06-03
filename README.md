# Virtualcam-script
### Dependency
```
sudo apt install v4l-utils v4l2loopback-utils obs-studio v4l2loopback-dkms
```

### Usage
* Run `starter.sh`
    ```
    sudo ./starter.sh
    ```
* Open `OBS > Controls > Settings > Stream`
    ```
    Service : Custom
    Server : rtmp://localhost:1935/virtualCam
    ```
* Then press `Start Streaming`

> This will create virtual camera called `MyVirtualCam`

![Google Meet](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png "Img1")

* Press `Stop Streaming` if you're done
