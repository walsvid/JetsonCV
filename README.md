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
```

## Install Caffe
Before installation, please check you have correctly installed jetpack3.2 and have installed git.
Please add cuda path to your `$PATH` in `.bashrc`
```bash
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
```

After setting environment variables, just run `Install_Caffe_JetsonTX2.sh`.

```bash
$ chmod +x Install_Caffe_JetsonTX2.sh
$ ./Install_Caffe_JetsonTX2.sh
```

The modified Caffe `Makefile.config` and `Makefile` has been copied to caffe root directory.

## Install Tensorflow
```bash
cd ./tensorflow/Jetpack-3.2/1.6

sudo pip2 install tensorflow-1.6.0rc1-cp27-cp27mu-linux_aarch64.whl
sudo pip3 install tensorflow-1.6.0rc1-cp35-cp35m-linux_aarch64.whl
```

To verify the installation:
```bash
python3 -c 'import tensorflow as tf; print(tf.__version__)'
<result 1.6.0 here>
$ python2 -c 'import tensorflow as tf; print(tf.__version__)'
<result 1.6.0 here>
```