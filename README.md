# JetsonCV
Installation script for computer vision libraries using in NVIDIA Jetson.

|    OS   | Ubuntu 16.04 64bit |
|:-------:|:------------------:|
| Jetpack |  3.2               |
| Jetson  | TX2                |

## Install OpenCV
Before installation, please check you have correctly installed jetpack3.2.
Simply run `Install_OpenCV_JetsonTX2.sh`.

```bash
$ chmod +x Install_OpenCV_JetsonTX2.sh
$ ./Install_OpenCV_JetsonTX2.sh
```
To verify the installation:
```bash
$ ls /usr/local/lib/python3.5/dist-packages/cv2.*
<result cv2.so here>
$ ls /use/local/lib/python2.7/dist-packages/cv2.*
<result cv2.so here>
$ python3 -c 'import cv2; print(cv2.__version__)'
<result 3.4.0 here>
$ python2 -c 'import cv2; print(cv2.__version__)'
<result 3.4.0 here>