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
    > This will create virtual camera called `MyVirtualCam`
* Open `OBS > Controls > Settings > Stream`
    ```
    Service : Custom
    Server : rtmp://localhost:1935/virtualCam
    ```
* Then press `Start Streaming`
    > This will feed `OBS` output to `MyVirtualCam`
* Set your streaming camera as `MyVirtualCam`

![Google Meet](https://raw.githubusercontent.com/catzy007/Virtualcam-script/master/img.png "Img1")

* Press `Stop Streaming` if you're done

> If `MyVirtualCam` not found, restart your browser or apps
