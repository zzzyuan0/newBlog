<template>

    <div id="article">
        <child-head>
            <template v-slot>
                <div id="articleInfo">
                    <div id="title">我是标题</div>
                    <div id="info">作者：1111 时间11111</div>
                </div>
            </template>
        </child-head>
        <div id="context" v-html="article.context"></div>
        <comment></comment>
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
            ChildHead: loadComponent("ChildHead"),
            Comment: loadComponent("Comment")
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
                    "\n"

            })
             article.context = marked(article.context)

            let listenMethod = ()=>{}

            return {
                article,listenMethod
            }
        },
        mounted() {
        this.listenMethod = setInterval(()=>{
            this.$refs.rightMenu.listenTop()
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
        #articleInfo{
            line-height: 10vh;
            width: 100%;
            text-align: center;
            #title {
                color: #ffffff;
                font-weight: 400;
                font-size: 8vh;
            }
        }

    }



    @media screen and (min-width: 768px) {
      body {
        /*width: 748px;*/
        margin: 10px auto;
      }
    }
</style>
