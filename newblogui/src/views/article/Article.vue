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
    import {reactive,ref, onMounted} from "vue"
    import {loadComponent} from "../../utils/importUtil";
    import {getArticleById} from "../../api/article"
    import {useRoute} from "vue-router";
    export default {
        name: "Article",
        components:{
            LeftMenu: loadComponent("LeftMenu"),
            RightMenu: loadComponent("RightMenu"),
            Music: loadComponent("Music"),
            ChildHead: loadComponent("ChildHead"),
            Comment: loadComponent("Comment")
        },
        setup(props, context){
            let article = reactive({
                title:"",
                heat:"",
                context: ""
            })
            article.context = marked(article.context)
            let router = useRoute()
            onMounted(() => {
                getArticleById(router.params).then(res => {
                    console.log(res)
                })
            })
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
