# Honor8Lite-Root

## 0x00 版本型号

华为同一机型对应的实际型号和系统版本差别较大，截图记录好，日后好恢复。

方法：1. 工程菜单。拨号界面输入 *`*#*#*2846579#**#*`* 2. 系统设置中查看关于手机。

## 0x01 解锁Bootloader

由于华为官方停止了从官方渠道解锁BL锁的服务，因此需要从闲鱼购买解锁服务。

软件名称是Ultimate NCK Huawei Module。

![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/7de24487-7214-4d9a-90a6-d0575374d811/419870bc-cb1d-48b3-992b-9fc2b65cc97b/image.png)

详细的教程卖家会提供，因此这里记录一下本次解锁时的步骤。

解锁步骤：

1. 连接加密狗。使用USB Redirector Client连接卖家远程提供的加密狗。
2. 使用NCK获取BL解锁码。需在手机工厂菜单的后台设置-USB端口设置中选择工厂模式。
    
    ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/7de24487-7214-4d9a-90a6-d0575374d811/453a6b52-e6da-493e-b7a3-fddade8062f2/image.png)
    
    
3. 进入fastboot模式解锁。手机同时按住音量减和开机键进入fastboot，然后在华为解锁工具里输入之前获取到的解锁码就能解bl锁了。
    
    ![image.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/7de24487-7214-4d9a-90a6-d0575374d811/aff57935-20be-43f7-870a-51acf334d610/image.png)
    
4. 解锁成功后，每次开机会出现警告页面。

## 0x02 刷入recovery

使用下面的奇兔刷机定制的TWRP ROM可以成功刷入。

https://github.com/dreamrover/honor8/blob/9e1a85e003afff6a277023642e39640f38f65e33/huawei-honor-8-em8_0-twrp3.2.1-7to-recovery-8.5.18.img

步骤：

```jsx
adb reboot bootloader
fastboot flash recovery_ramdisk huawei-honor-8-em8_0-twrp3.2.1-7to-recovery-8.5.18.img
fastboot reboot
adb reboot recovery
```

## 0x03 使用Magisk获取Root

1. 下载安装最新版的Magisk软件，本次使用的是Magisk-v27.0
2. 备份boot分区。由于系统的data分区是加密的，因此需要插入一张外置的SD卡。进入上一步中刷入的recovery，备份Boot Ramdisk到SD卡。
3. 给Boot镜像打补丁。重启进入系统，使用Magisk APP，选择SD卡TWRP目录下的ramdisk.emmc.win，应用补丁。之后把SD卡下的magisk-xxx.img复制并重命名，替换掉ramdisk.emmc.win。记得把之前的ramdisk.emmc.win备份一下。
4. 刷入修改后的boot分区。进入recovery，恢复patch后的Boot Ramdisk分区。
5. 重启进入系统，安装RootExplorer，即可看到Root权限申请界面，Root成功。

