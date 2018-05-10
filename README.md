# JetsonCV
Installation script for computer vision libraries using in NVIDIA Jetson.

|Framework |      Version       |
|:--------:|:------------------:|
|    OS    | Ubuntu 16.04 64bit |
| Jetpack  | 3.2                |
| Jetson   | TX2                |
|  OpenCV  | 3.4                |
|  Caffe   | 1.0                |
|Tensorflow| 1.6                |

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





$$
\sum_{k} \frac{1}{N_{k}^{c}} \sum_{i \in A_{k}} l_{c} (p_i, g_i) + \lambda \sum_{k} \frac{1}{N_{k}^{r}} \sum_{i \in A_{k}} \mathbf{1}(g_i=1)l_{r}(b_i,t_i)
$$
这里:

$k = index(\{\mathit{M}\}_1^k)$

$M\in {M_1,M_2,M_3}$

$A_{k}$ is the set of anchors in $M_k$.


$\mathbf{1}()$ is Indicator function

$l_c$ is face classiﬁcation loss

$p_i$ predicted category

$g_i$ ground truth

$l_r$ represents the bounding box regression loss

$b_i$ predicted bounding box

$t_i$ target box

$N_{k}^{c}$ is the number of anchors in module $M_k$

$N_{k}^{r}=\sum_{i \in A_{k}}\mathbf{1}(g_i=1)$ is the number of anchors in module $M_k$, limits the regression loss only to the positively assigned anchors