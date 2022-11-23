<template>

    <div id="article">
        <child-head>
            <template v-slot>
                <div id="articleInfo">
                    <div id="title">{{articleInfo.article.title}}</div>
                    <div id="info">
                        作者： {{articleInfo.userInfo.name}}   <br/>
                        时间: {{articleInfo.article.createTime}}
                    </div>
                    <div id="categories">
                         <span class="category" v-for="item in articleInfo.article.categories">
                             {{item.name}}
                         </span>
                    </div>
                </div>
            </template>
        </child-head>
        <div id="context" v-html="articleInfo.article.content">
        </div>
        <comment v-if="articleId !== 0" :articleId="articleId"></comment>
        <left-menu id="leftMenu"></left-menu>
        <right-menu id="rightMenu" ref="rightMenu"></right-menu>
        <user-menu id="user-menu"></user-menu>
    </div>
</template>

<script>
    import marked from "marked"
    import {reactive,ref, onMounted} from "vue"
    import {loadComponent} from "../../utils/importUtil";
    import {getArticleById} from "../../api/blog"
    import {useRoute} from "vue-router";
    export default {
        name: "Article",
        components:{
            LeftMenu: loadComponent("LeftMenu"),
            RightMenu: loadComponent("RightMenu"),
            Music: loadComponent("Music"),
            ChildHead: loadComponent("ChildHead"),
            Comment: loadComponent("Comment"),
            UserMenu: loadComponent("UserMenu")
        },
        setup(props, context){
            let articleInfo = reactive({
                "userInfo": {
                    "name": ""
                },
                "article": {
                    "title": "",
                    "content": "",
                    "heat": 0,
                    "createTime": "",
                    "categories": []
                }
            })
            let router = useRoute()
            let articleId = ref(0)
            onMounted(() => {
                   articleId.value = router.params.id
                    getArticleById({
                        id: articleId.value
                    }).then(res => {
                        Object.assign(articleInfo, res)
                        articleInfo.article.content = marked(articleInfo.article.content)
                    })

            })
            let listenMethod = ()=>{}

            return {
                articleInfo,listenMethod,articleId
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
<style lang="less" src="../../conf/markDownStyle.less">
</style>
<style lang="less" scoped>


    #context{
        width: 60vw;
        margin: 0 auto;
        background: #10101080;
        padding: 1vw;
    }

    #article{
        #articleInfo{
            padding-top: 4vh;
            padding-bottom: 4vh;
            line-height: 7vh;
            width: 100%;
            text-align: center;
            #title {
                color: #ffffff;
                font-weight: 400;
                font-size: 8vh;
            }
            #categories {
                line-height: 1vh;
            }
            .category {
                border: silver 1px solid;
                margin: 0 5px;
                padding: 1px 5px;
                border-radius: 15px;
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
