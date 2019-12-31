#!/bin/bash
# Copyright (c) 2000-2016 Synology Inc. All rights reserved.

source /pkgscripts-ng/include/pkg_util.sh

package="gofrpc"
version="1.0.1"
displayname="gofrpc"
dsmuidir="ui"
dsmappname="SYNO.SDS.gofrpc"
distributor="jie800@163.com"
maintainer="秋三十爷"
maintainer_url="http://blog.5941188.com"
helpurl="https://github.com/fatedier/frp"
arch="noarch"
#arch="$(pkg_get_unified_platform)"
firmware="6.0-5914"
os_min_ver="6.0-5914"
support_conf_folder="yes"
description="内网穿透神器--frpc，个人整合为spk包，自适应arm,arm64,x86,x64四个平台，支持网页配置，及提供了一些配置模板，供大家食用。当前frpc版本：0.30.0"
#silent_install="yes"
silent_upgrade="yes"
silent_uninstall="yes"
thirdparty="yes"
adminprotocol="http"
adminurl="static/#"
adminport="8760"
[ "$(caller)" != "0 NULL" ] && return 0
pkg_dump_info
