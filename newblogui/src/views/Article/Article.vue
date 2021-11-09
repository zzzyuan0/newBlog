<template>

    <div id="article">
        <child-head></child-head>
        <div id="title"></div>
        <div id="info"></div>
        <div id="context" v-html="article.context"></div>
        <left-menu></left-menu>
        <right-menu ref="rightMenu"></right-menu>

    </div>
</template>

<script>
    import marked from "marked"
    import {reactive,ref} from "vue"
    import {loadComponent} from "../../utils/importUtil";
    export default {
        name: "Article",
        components:{
            LeftMenu: loadComponent("LeftMenu"),
            RightMenu: loadComponent("RightMenu"),
            Music: loadComponent("Music"),
            ChildHead: loadComponent("ChildHead")
        },
        setup(){
            let article = reactive({
                title:"無名植物",
                heat:"13",
                context: "---\n" +
                    "title:  Docker 入门\n" +
                    "date: 2020-8-8 17:28:52\n" +
                    "categories:\n" +
                    "- Docker\n" +
                    "\n" +
                    "---\n" +
                    "\n" +
                    "# Docker\n" +
                    "\n" +
                    "* Docker 概述\n" +
                    "* Docker 安装\n" +
                    "* Docker 命令\n" +
                    "  * 镜像命令\n" +
                    "  * 容器命令\n" +
                    "  * 操作命令\n" +
                    "  * ...\n" +
                    "* Docker 镜像\n" +
                    "* 容器的数据卷\n" +
                    "* DockerFile\n" +
                    "* Docker 网络原理\n" +
                    "* idea 整合 Docker\n" +
                    "* Docker Compose\n" +
                    "* Docker Swarm\n" +
                    "* Cl\\CD jenkins\n" +
                    "\n" +
                    "---\n" +
                    "\n" +
                    "## Docker 概述\n" +
                    "\n" +
                    "### Docker 为什么会出现\n" +
                    "\n" +
                    "* 环境配置是非常麻烦的\n" +
                    "* 在我的电脑上可以运行，在你的电脑无法运行\n" +
                    "* 打包部署无法直接运行\n" +
                    "\n" +
                    "### Docker 应运而生\n" +
                    "\n" +
                    "* Docker 的思想来自于集装箱\n" +
                    "* Docker通过隔离机制，将服务器利用到极致\n" +
                    "\n" +
                    "![image-20200806094803373](http://img.zzzyuan.cn/image-20200806094803373.png)\n" +
                    "\n" +
                    "![image-20200806095042373](http://img.zzzyuan.cn/image-20200806095042373.png)\n" +
                    "\n" +
                    "## Docker的安装\n" +
                    "\n" +
                    "* 先去 Docker 官方文档 [Docker 官方文档](https://docs.docker.com/)\n" +
                    "* 点击 **Download and install**\n" +
                    "* 选择你的系统版本**，Windows Linux mac** 都可以，其中会有教程教你一步步下载\n" +
                    "\n" +
                    "### 以cent os7为例\n" +
                    "\n" +
                    "* 卸载原来的Docker 如果没有则忽视\n" +
                    "\n" +
                    "````shell\n" +
                    "yum remove docker \\\n" +
                    "                  docker-client \\\n" +
                    "                  docker-client-latest \\\n" +
                    "                  docker-common \\\n" +
                    "                  docker-latest \\\n" +
                    "                  docker-latest-logrotate \\\n" +
                    "                  docker-logrotate \\\n" +
                    "                  docker-engine\n" +
                    "````\n" +
                    "\n" +
                    "* 安装相关依赖\n" +
                    "\n" +
                    "```\n" +
                    "yum install -y yum-utils\n" +
                    "```\n" +
                    "\n" +
                    "* 设置默认镜像并下载DOCKER\n" +
                    "\n" +
                    "```shell\n" +
                    "yum-config-manager \\\n" +
                    "    --add-repo \\\n" +
                    "   # https://download.docker.com/linux/centos/docker-ce.repo 不使用默认的镜像地址\n" +
                    "   \n" +
                    "   yum-config-manager \\\n" +
                    "    --add-repo \\\n" +
                    "   https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo # 推荐使用阿里云\n" +
                    "\n" +
                    "#下载docker   \n" +
                    " yum install docker-ce docker-ce-cli containerd.io\n" +
                    " \n" +
                    "\n" +
                    "```\n" +
                    "\n" +
                    "* 启动docker \n" +
                    "\n" +
                    "```shell\n" +
                    "systemctl start docker\n" +
                    "```\n" +
                    "\n" +
                    "* 查看docker版本（如果可以查看则已经启动成功）\n" +
                    "\n" +
                    "````shell\n" +
                    "docker --version\n" +
                    "````\n" +
                    "\n" +
                    "![image-20200806102920569](http://img.zzzyuan.cn/image-20200806102920569.png)\n" +
                    "\n" +
                    "* 下载Holle-world镜像（测试镜像源是否正确）\n" +
                    "\n" +
                    "```shell\n" +
                    "docker run hello-world\n" +
                    "```\n" +
                    "\n" +
                    "![image-20200806103155943](http://img.zzzyuan.cn/image-20200806103155943.png)\n" +
                    "\n" +
                    "* 查看镜像\n" +
                    "\n" +
                    "````shell\n" +
                    "docker images\n" +
                    "````\n" +
                    "\n" +
                    "![image-20200806103254836](http://img.zzzyuan.cn/image-20200806103254836.png)\n" +
                    "\n" +
                    "* 卸载docker\n" +
                    "\n" +
                    "````shell\n" +
                    "yum remove docker-ce docker-ce-cli containerd.io //卸载docker\n" +
                    "rm -rf /var/lib/docker //删除docker默认工作路径\n" +
                    "````\n" +
                    "\n" +
                    "---\n" +
                    "\n" +
                    "## 常用Docker 命令\n" +
                    "\n" +
                    "---\n" +
                    "\n" +
                    "### 帮助命令\n" +
                    "\n" +
                    "````shell\n" +
                    "docker vesion # 查看版本\n" +
                    "docker info   # 查看docker 信息\n" +
                    "docker -- help # 帮助命令\n" +
                    "````\n" +
                    "\n" +
                    "---\n" +
                    "\n" +
                    "### 镜像命令\n" +
                    "\n" +
                    "````shell\n" +
                    "docker images --help # 查看镜像常用命令\n" +
                    "\n" +
                    "Options:\n" +
                    "  -a, --all             Show all images (default hides intermediate images)\n" +
                    "      --digests         Show digests\n" +
                    "  -f, --filter filter   Filter output based on conditions provided\n" +
                    "      --format string   Pretty-print images using a Go template\n" +
                    "      --no-trunc        Don't truncate output\n" +
                    "  -q, --quiet           Only show numeric IDs\n" +
                    "\n" +
                    "docker images # 查看镜像\n" +
                    "````\n" +
                    "\n" +
                    "| REPOSITORY   | TAG  | IMAGE ID | CREATED    | SIZE       |\n" +
                    "| ------------ | ---- | -------- | ---------- | ---------- |\n" +
                    "| 镜像的仓库源 | 标签 | 镜像的id | 创建的时间 | 镜像的大小 |\n" +
                    "\n" +
                    "````shell\n" +
                    "docker search 镜像名   #搜索镜像\n" +
                    "docker search 镜像名 --filter=STARS=3000  # 搜索出star 数大于三千的目标\n" +
                    "````\n" +
                    "\n" +
                    "![image-20200806121809277](http://img.zzzyuan.cn/image-20200806121809277.png)\n" +
                    "\n" +
                    "````shell\n" +
                    "docker pull 镜像名 # 下载目标镜像，默认最新版本\n" +
                    "docker pull 镜像名:版本 # 选择版本下载\n" +
                    "\n" +
                    "docker rmi -f 镜像id #删除指定的镜像\n" +
                    "\n" +
                    "docker images -aq # 查找所有镜像id\n" +
                    "\n" +
                    "docker rmi -f $(docker images -aq) #删除所有镜像\n" +
                    "````\n" +
                    "\n" +
                    "### 容器命令\n" +
                    "\n" +
                    "> 下载镜像**centos**为例\n" +
                    "\n" +
                    "````shell\n" +
                    "docker pull centos # 下载centos 镜像\n" +
                    "\n" +
                    "docker run[参数] image\n" +
                    "# 参数说明\n" +
                    "--name=\"Name\" # 容器名字 ，用来区分容器\n" +
                    "-d # 后台方式运行\n" +
                    "-it # 使用交互方式运行，进入容器查看内容\n" +
                    "-p # 指定容器端口 -p 8080:8080\n" +
                    "\t-p ip:主机端口：容器端口\n" +
                    "\t-p 主机端口:容器端口\n" +
                    "\t-p 容器端口\n" +
                    "\t\n" +
                    "docker run -it -rm tomcat # 用完即删\t\n" +
                    "````\n" +
                    "\n" +
                    "* 启动镜像，进入容器 的命令端\n" +
                    "\n" +
                    "![image-20200806192448711](http://img.zzzyuan.cn/image-20200806192448711.png)\n" +
                    "\n" +
                    "* 输入exit 退出容器，并且停止。\n" +
                    "\n" +
                    "![image-20200806192651473](http://img.zzzyuan.cn/image-20200806192651473.png)\n" +
                    "\n" +
                    "````shell\n" +
                    "docker ps #查看正在运行的容器\n" +
                    "````\n" +
                    "\n" +
                    "![image-20200806192845489](http://img.zzzyuan.cn/image-20200806192845489.png)\n" +
                    "\n" +
                    "````shell\n" +
                    "docker ps -a # 查看曾经运行的容器\n" +
                    "````\n" +
                    "\n" +
                    "![image-20200806192942738](http://img.zzzyuan.cn/image-20200806192942738.png)\n" +
                    "\n" +
                    "````shell\n" +
                    "docker ps -a -n=1 # 查看最近创建的容器\n" +
                    "````\n" +
                    "\n" +
                    "![image-20200806193234651](http://img.zzzyuan.cn/image-20200806193234651.png)\n" +
                    "\n" +
                    "````shell\n" +
                    "docker ps -aq # 显示所有容器编号\n" +
                    "\n" +
                    "ctrl + p + q # 退出容器，不停止\n" +
                    "````\n" +
                    "\n" +
                    "* 删除容器\n" +
                    "\n" +
                    "````shell\n" +
                    "docker rm 容器id # 删除容器\n" +
                    "docker rm -f $(docker ps -aq) # 删除所有容器\n" +
                    "\n" +
                    "````\n" +
                    "\n" +
                    "* 启动和停止容器\n" +
                    "\n" +
                    "````shell\n" +
                    "docker start 容器id # 启动容器\n" +
                    "docker restart 容器id # 重启容器\n" +
                    "docker stop 容器id # 停止容器\n" +
                    "docker kill 容器id # 强制停止容器\n" +
                    "````\n" +
                    "\n" +
                    "## 常用的进阶命令\n" +
                    "\n" +
                    "* 后台启动\n" +
                    "\n" +
                    "  ````shell\n" +
                    "  docker run -d 镜像 \n" +
                    "  # 启动后发现无前台进程，会自动立刻停止\n" +
                    "  ````\n" +
                    "\n" +
                    "* 查看日志\n" +
                    "\n" +
                    "````shell\n" +
                    "docker logs --help # 查看日志相关命令\n" +
                    "````\n" +
                    "\n" +
                    "![image-20200806195357513](http://img.zzzyuan.cn/image-20200806195357513.png)\n" +
                    "\n" +
                    "* 查看容器中的进程信息\n" +
                    "\n" +
                    "````shell\n" +
                    "docker top 容器id\n" +
                    "````\n" +
                    "\n" +
                    "* 查看容器源数据\n" +
                    "\n" +
                    "````shell\n" +
                    "docker inspect 容器id \n" +
                    "````\n" +
                    "\n" +
                    "* 进入当前正在运行的容器\n" +
                    "\n" +
                    "````shell\n" +
                    "docker exec -it 容器id  /bin/bash\n" +
                    "\n" +
                    "docker attach 容器id \n" +
                    "\n" +
                    "# 区别 \n" +
                    "# docker exec 进入容器后开启一个新的终端 \n" +
                    "# 进入容器正在执行的终端，不会启动新终端\n" +
                    "````\n" +
                    "\n" +
                    "* 从容器内拷贝文件到主机\n" +
                    "\n" +
                    "````shell\n" +
                    "docker cp 容器id:主机拷贝到的地址\n" +
                    "````\n" +
                    "\n" +
                    "### 总结\n" +
                    "\n" +
                    "![image-20200806201218580](http://img.zzzyuan.cn/image-20200806201218580.png)\n" +
                    "\n" +
                    "## Docker 安装 nginx\n" +
                    "\n" +
                    "* 查询一下 nginx\n" +
                    "\n" +
                    "````shell\n" +
                    "docker search nginx\n" +
                    "````\n" +
                    "\n" +
                    "![image-20200806201955782](http://img.zzzyuan.cn/image-20200806201955782.png)\n" +
                    "\n" +
                    "* 下载 nginx 镜像\n" +
                    "\n" +
                    "````shell\n" +
                    "docker pull nginx\n" +
                    "````\n" +
                    "\n" +
                    "![image-20200806202051106](http://img.zzzyuan.cn/image-20200806202051106.png)\n" +
                    "\n" +
                    "* 查看安装的镜像\n" +
                    "\n" +
                    "````shell\n" +
                    "docker images\n" +
                    "````\n" +
                    "\n" +
                    "![image-20200806202116272](http://img.zzzyuan.cn/image-20200806202116272.png)\n" +
                    "\n" +
                    "* 后台运行nginx 镜像 别名为 nginx01 主机端口3344映射容器端口80\n" +
                    "\n" +
                    "```shell\n" +
                    "docker run -d --name nginx01 -p 3344:80 nginx\n" +
                    "```\n" +
                    "\n" +
                    "![image-20200806202208472](http://img.zzzyuan.cn/image-20200806202208472.png)\n" +
                    "\n" +
                    "* 查看 nginx 运行成功后的页面\n" +
                    "\n" +
                    "![image-20200806202249824](http://img.zzzyuan.cn/image-20200806202249824.png)\n" +
                    "\n" +
                    "* 由于以上操作都是我在阿里云服务器上的操作 ，因此我可以通过外网+端口直接访问（端口一定是开放状态）。\n" +
                    "\n" +
                    "![image-20200806203038140](http://img.zzzyuan.cn/image-20200806203038140.png)\n" +
                    "\n" +
                    "## Docker 可视化界面管理\n" +
                    "\n" +
                    "````shell\n" +
                    "docker run -d -p 8088:9000 \\\n" +
                    "--restart=always -v /var/run/docker.sock:/var/run/docker.sock --privileged=true portainer/portainer\n" +
                    "````\n" +
                    "\n" +
                    "* 浏览器访问如果你是本地运行的，直接 localhost:8088 ,如果是服务器上就服务器ip+端口（图形化界面用的少，可以忽略）\n" +
                    "\n" +
                    "![image-20200806210518005](http://img.zzzyuan.cn/image-20200806210518005.png)\n" +
                    "\n" +
                    "## Docker镜像详解\n" +
                    "\n" +
                    "---\n" +
                    "\n" +
                    "### 镜像是啥？\n" +
                    "\n" +
                    "镜像是一种轻量级，可执行的独立软件包，用来打包软件运行环境和基于运行环境开发的软件，他包含运行某个软件所需的所有内容，包括代码，库，环境变量，配置环境等。\n" +
                    "\n" +
                    "---\n" +
                    "\n" +
                    "### Docker 镜像加载原理\n" +
                    "\n" +
                    "#### UnionFs (联合文件系统)\n" +
                    "\n" +
                    "![image-20200806211504915](http://img.zzzyuan.cn/image-20200806211504915.png)\n" +
                    "\n" +
                    "#### Docker镜像加载原理\n" +
                    "\n" +
                    "![image-20200806211614021](http://img.zzzyuan.cn/image-20200806211614021.png)\n" +
                    "\n" +
                    "* 特点：Docker 镜像都是只读的，当容器启动时，一个新的可写层被加载到镜像顶部，这一层叫做容器层，下面的都是镜像层。\t\n" +
                    "\n" +
                    "### COMMIT 镜像\n" +
                    "\n" +
                    "````shell\n" +
                    "docker commit #提交容器成为一个新的副本\n" +
                    "docker commit -m=\"提交的描述信息\" -a=\"作者\" 容器id 目标镜像名：[tag]\n" +
                    "````\n" +
                    "\n" +
                    "----\n" +
                    "\n" +
                    "## 容器数据卷\n" +
                    "\n" +
                    "> 什么是容器数据卷？\n" +
                    "\n" +
                    "容器之间数据共享！Docker 容器产生的数据，同步到本地！\n" +
                    "\n" +
                    "特点：持久化和同步操作，容器间的数据共享。\n" +
                    "\n" +
                    "## 数据卷的使用\n" +
                    "\n" +
                    "### 方法一\n" +
                    "\n" +
                    "````shell\n" +
                    "docker run -it -v 主机目录:容器目录 容器名  # 两者目录同步\n" +
                    "````\n" +
                    "\n" +
                    "* 启动镜像centos 并将主机的 home/ceshi 映射到容器 内 /home\n" +
                    "* ![image-20200807102351638](http://img.zzzyuan.cn/image-20200807102351638.png)\n" +
                    "* 然后退出容器 ctrl + p + q\n" +
                    "* 查看容器 centos 源数据\n" +
                    "\n" +
                    "![image-20200807102649667](http://img.zzzyuan.cn/image-20200807102649667.png)\n" +
                    "\n" +
                    "* 找到下面代码，可以看到我们的地址挂载成功\n" +
                    "\n" +
                    "````shell\n" +
                    "\"Mounts\": [\n" +
                    "            {\n" +
                    "                \"Type\": \"bind\",\n" +
                    "                \"Source\": \"/home/ceshi\",\n" +
                    "                \"Destination\": \"/home\",\n" +
                    "                \"Mode\": \"\",\n" +
                    "                \"RW\": true,\n" +
                    "                \"Propagation\": \"rprivate\"\n" +
                    "            }\n" +
                    "        ],\n" +
                    "\n" +
                    "\n" +
                    "````\n" +
                    "\n" +
                    "* 挂载成功后 ，你在容器home内的一切文件都会同步到你的主机/home/ceshi中，主机中的一切文件也会同步到容器中。\n" +
                    "\n" +
                    "![image-20200807104509568](http://img.zzzyuan.cn/image-20200807104509568.png)\n" +
                    "\n" +
                    "### 具名挂载和匿名挂载\n" +
                    "\n" +
                    "#### 具名\n" +
                    "\n" +
                    "````shell\n" +
                    "docker run -it -v 数据卷名字:容器目录 容器名  # 默认保存在  /var/lib/docker/volumes/数据卷名字\n" +
                    "````\n" +
                    "\n" +
                    "#### 匿名\n" +
                    "\n" +
                    "````shell\n" +
                    "docker run -it -v 容器目录 容器名  # 默认保存在  /var/lib/docker/volumes/随机名字\n" +
                    "````\n" +
                    "\n" +
                    " ### 设置可读可写\n" +
                    "\n" +
                    "````shell\n" +
                    "docker run -it -v 本地目录:容器目录:ro 容器名 # 只写\n" +
                    "docker run -it -v 本地目录:容器目录:rw 容器名 # 可读可写，默认\n" +
                    "````\n" +
                    "\n" +
                    "### 使用 --volumes -from \n" +
                    "\n" +
                    "````dockerfile\n" +
                    "docker run -it --name docker01 --volumes -from 容器二 镜像名\n" +
                    "# 不同容器间数据卷共享\n" +
                    "````\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "## Docker mysql数据同步实战\n" +
                    "\n" +
                    "> 具体mysql镜像下载配置可以去 docker hub 搜索 mysql查看\n" +
                    ">\n" +
                    "> https://hub.docker.com/\n" +
                    "\n" +
                    "* 先下载mysql镜像\n" +
                    "\n" +
                    "![image-20200807105157693](http://img.zzzyuan.cn/image-20200807105157693.png)\n" +
                    "\n" +
                    "* 启动mysql，同时挂载相关地址。启动后就可以直接连接你的数据库了\n" +
                    "\n" +
                    "````shell\n" +
                    "docker run -d -p 3310:3306 -v /home/mysql/conf:/etc/mysql/conf.d -v /home/mysql/data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=mysql初始密码 --name mysql01 mysql:5.7\n" +
                    "````\n" +
                    "\n" +
                    "* 在主机下的home目录也可以查看到mysql容器内的内容\n" +
                    "\n" +
                    "![image-20200807111119251](http://img.zzzyuan.cn/image-20200807111119251.png)\n" +
                    "\n" +
                    "* 删除容器后，查看主机mysql数据，依旧存在。\n" +
                    "\n" +
                    "![image-20200807111316525](http://img.zzzyuan.cn/image-20200807111316525.png)\n" +
                    "\n" +
                    "## Dockerfile \n" +
                    "\n" +
                    "> Dockerfile 就是用来构建docker 镜像的构建文件命令脚本。\n" +
                    ">\n" +
                    "> 通过脚本可以生成镜像\n" +
                    "\n" +
                    "````dockerfile\n" +
                    "# 创建一个dockerfile文件并写\n" +
                    "vim dockerfile1\n" +
                    "# 文件内容\n" +
                    "FROM centos    # 基础镜像\n" +
                    "VOLUME [\"挂载目录名\"，\"挂载目录名\"] #镜像生成容器后，容器内部会有相对应的目录与主机目录挂载\n" +
                    "CMD echo \"生成后发送的文字\"\n" +
                    "CMD /bin/bash # 生成后进入\n" +
                    "# 保存后退出\n" +
                    "\n" +
                    "# 生成镜像\n" +
                    "docker bulid -f dockerfile文件路径 -t 生成镜像名字:版本 . #点的意思是在当前路径下生成\n" +
                    "````\n" +
                    "\n" +
                    "### 基础知识 \n" +
                    "\n" +
                    "* 每个关键字都是大写字母\n" +
                    "\n" +
                    "* 执行从上到下\n" +
                    "\n" +
                    "* #注释\n" +
                    "\n" +
                    "* 每一个指令都是一个镜像层\n" +
                    "\n" +
                    "  ![image-20200807143530279](http://img.zzzyuan.cn/image-20200807143530279.png)\n" +
                    "\n" +
                    "* 如下图\n" +
                    "\n" +
                    "![image-20200807144920104](http://img.zzzyuan.cn/image-20200807144920104.png)\n" +
                    "\n" +
                    "* 然后运行指令\n" +
                    "\n" +
                    "````shell\n" +
                    "docker build -f mydockerfile -t mycentos:0.1 .  # 中间的mydockerfile是文件名 \n" +
                    "````\n" +
                    "\n" +
                    "* 生成镜像成功\n" +
                    "\n" +
                    "![image-20200807145110625](http://img.zzzyuan.cn/image-20200807145110625.png)\n" +
                    "\n" +
                    "* 查看某镜像构建历史\n" +
                    "\n" +
                    "````shell\n" +
                    "docker history 镜像id\n" +
                    "````\n" +
                    "\n" +
                    "![image-20200807150400022](http://img.zzzyuan.cn/image-20200807150400022.png)\n" +
                    "\n" +
                    "## 制作Tomcat 镜像\n" +
                    "\n" +
                    "* 创建文件Dockerfile 官方默认文件名字，等下构建时可以省略文件名。\n" +
                    "* vim Dockerfile 添加如下代码\n" +
                    "\n" +
                    "````dockerfile\n" +
                    "FROM centos\n" +
                    "MAINTAINER zzzyuan\n" +
                    "\n" +
                    "COPY readme.txt /usr/local/readme.txt\n" +
                    "ADD jdk-8u261-linux-x64.tar.gz /usr/local/\n" +
                    "ADD apache-tomcat-9.0.37.tar.gz /usr/local/\n" +
                    "\n" +
                    "RUN yum -y install vim\n" +
                    "ENV MYPATH /usr/local\n" +
                    "WORKDIR $MYPATH\n" +
                    "\n" +
                    "ENV JAVA_HOME /usr/local/jdk1.8.0_261\n" +
                    "ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar\n" +
                    "ENV CATALINA_HOME /usr/local/apache-tomcat-9.0.37\n" +
                    "ENV CATALINA_BASE /usr/local/apache-tomcat-9.0.37\n" +
                    "ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin\n" +
                    "\n" +
                    "\n" +
                    "EXPOSE 8080\n" +
                    "\n" +
                    "CMD /usr/local/apache-tomcat-9.0.37/bin/startup.sh && tail -F /u/usr/local/apache-tomcat-9.0.37/bin/logs/catalina.out \n" +
                    "\n" +
                    "````\n" +
                    "\n" +
                    "* 构建镜像\n" +
                    "\n" +
                    "````\n" +
                    "docker build -t diytomcat .\n" +
                    "````\n" +
                    "\n" +
                    "* 运行镜像\n" +
                    "\n" +
                    "````shell\n" +
                    "docker run -d -p 9090:8080 --name mytomcat01 -v /home/yuan/tomcat/test:/usr/local/apache-tomcat-9.0.37/webapps/test -v /home/yuan/tomcat/logs:/usr/local/apache-tomcat-9.0.37/logs diytomcat\n" +
                    "````\n" +
                    "\n" +
                    "* 运行后可以直接访问 路径为ip + 端口\n" +
                    "\n" +
                    "![image-20200807163025127](http://img.zzzyuan.cn/image-20200807163025127.png)\n" +
                    "\n" +
                    "## 发布自己的镜像\n" +
                    "\n" +
                    "* 先去Dockerhub注册一个自己的账号https://hub.docker.com/\n" +
                    "* 在主机上登录自己的账号\n" +
                    "\n" +
                    "````shell\n" +
                    "docker login -p 密码 -u 账号\n" +
                    "\n" +
                    "Options:\n" +
                    "  -p, --password string   Password\n" +
                    "      --password-stdin    Take the password from stdin\n" +
                    "  -u, --username string   Username\n" +
                    "\n" +
                    "docker -logout # 退出账号\n" +
                    "````\n" +
                    "\n" +
                    "* 提交自己的镜像\n" +
                    "\n" +
                    "````shell\n" +
                    "docker tag 镜像id 作者/镜像名:版本号 # 修改镜像名，防止重复\n" +
                    "docker push 镜像名:版本 # 提交镜像\n" +
                    "````\n" +
                    "\n" +
                    "## 总结\n" +
                    "\n" +
                    "![image-20200807170848727](http://img.zzzyuan.cn/image-20200807170848727.png)\n" +
                    "\n" +
                    "## Docker 网络（延伸）\n" +
                    "\n" +
                    "\n" +
                    "\n"

            })
             article.context = marked(article.context)

            let listenMethod = ()=>{}

            return {
                article,listenMethod
            }
        },mounted() {
        this.listenMethod = setInterval(()=>{
            this.$refs.rightMenu.listenTop()
            this.autoShowArticles()
        },200)
    },unmounted() {
        clearInterval(this.listenMethod)
    }
    }
</script>
<style>
    body{
        margin: 0 auto;
        font-family: "Microsoft YaHei", arial,sans-serif;
        color: #ffffff;
        line-height: 1;
    }
</style>
<style lang="less" scoped>
    @import "../../conf/markDownStyle.css";


    #context{
        width: 60vw;
        margin: 0 auto;
        background: #10101080;
        padding: 1vw;
    }

    #article{

    }



    @media screen and (min-width: 768px) {
      body {
        /*width: 748px;*/
        margin: 10px auto;
      }
    }
</style>
