# frpc_spk_build 项目说明
- build frpc to spk package in synology dsm.
- 将frpc打包成群晖的spk安装包，方便分享与传播.
- 集成了frpc版本：0.30.0
- 群晖的打包除了官方环境的下载与部署之外，本身项目的spk构造也是很烦琐的一下事情，在本项目中我已将所有的构造文件写好，并push到了本项目中，可以直接一键打包.
- 同时，希望本项目对大家日后打其他spk包有参考作用
- 感谢源项目:https://github.com/fatedier/frp

# 打包环境构建
## 1. clone或者下载本项目
```
git clone https://github.com/qiusanshiye/frpc_spk_build.git
```

## 2. 下载群晖官方打包工具
```
cd frpc_spk_build
git clone https://github.com/SynologyOpenSource/pkgscripts-ng.git
```

## 3. 部署群晖官方打包环境
```
cd pkgscripts-ng
./EnvDeploy -v 6.0 -p x64
# 我这里部署的是群晖的 x64 架构的6.0版本的DSM环境
# 注意：这里需要python环境，我这里用的是python2.7。其他版本未测试。
```
待部署完成后，目录结构会是这样:
```
# tree -L 1
.
├── build_env # 新增的目录，群晖的chroot打包签名环境
├── gofrpc_build.sh # 一键打包脚本
├── LICENSE
├── pkgscripts-ng # 第2步中下载的打包工具
├── README.md
├── result_spk  # 这个建议先手动创建，在打包之后会输出到这个目录
├── source    # 项目文件构造
└── toolkit_tarballs  # 新增的目录，群晖的打包环境镜像
```

## 4. 生成spk签名证书
```
gpg --gen-key
cp -rf ~/.gnupg ./build_env/ds.x64-6.0/root/
```

## 5. 开始一键打包
- 先更新frpc最新版本
> 在[这里](https://github.com/fatedier/frp/releases)下载最新的frp包，解压后拷贝frpc到 ./source/gofrpc/bin/arch/目录下
> 当前我已集成了frpc的0.30.0版本的程序

- 再更新想要打包的spk的版本号
```
vim source/gofrpc/INFO.sh
# 修改字段 version="1.0.1"
```

- 开始一键打包
```
./gofrpc_build.sh
# 没有出错的情况下会看到以下日志输出:
# [SUCCESS] PkgCreate.py -v 6.0 -p x64 -c gofrpc finished.
# 最终输出的spk路径：./build_env/ds.x64-6.0/image/packages/gofrpc-1.0.1.spk
# 也可以在这里找到: ./result_spk/gofrpc-1.0.1/
# 接下就可以上群晖套件中心手动安装试试啦
```
如果不想部署这么简单(个鬼)的打包环境，也可以直接使用我已经打好的包, 点击项目[releases](https://github.com/qiusanshiye/frpc_spk_build/releases)下载

## 6. 环境部署与打包过程中可能会遇到的问题
- 提示没有权限
> 非root用户执行上述各步时，请使用 sudo 执行

- 群晖镜像无法下载或者太慢
> 建议屏蔽工具中的下载逻辑：打开 pkgscripts-ng/EnvDeploy, 注释：urllib.request.urlretrieve(url, dest, reporthook=reporthook) 这一行（大概在86行）
> 在上述的第3步中执行EnvDeploy命令时，会输出下载链接，我们可以把用迅雷下载，完后拷贝到 toolkit_tarballs 目录。
> 再次执行3步EnvDeploy命令即可.

- 怎么打fprs的spk包
> 拷贝一份本项目，把所有的 frpc文字 改成 frps
> 将各个平台的frps可执行文件拷贝到这个目录：./source/gofrpc/bin/arch/
> 执行一键打包脚本即可

- 其他问题
> 请移步[这里](http://blog.5941188.com/archives/%E7%BE%A4%E6%99%96%E5%A5%97%E4%BB%B6%E6%89%93%E5%8C%85)

