<template>
    <div id="forum">
        <child-head>
            <template v-slot>
                <button class="addBtn" @click="isShowAdd = true" title="发表新贴">+</button>
            </template>
        </child-head>
        <div id="context">
            <div class="top">
                <router-link :to="{name:'Post'}">
                    <div class="item">
                        <span>置顶</span>
                    </div>
                </router-link>

            </div>
            <el-divider></el-divider>
            <div class="add"></div>
            <router-link :to="{name:'Post'}">
            <div class="post">
                <label>内容</label>
                <label>发表人</label>
                <label>讨论数</label>
            </div>
            </router-link>
            <router-link :to="{name:'Post'}">
                <div class="post"></div>
            </router-link>
            <router-link :to="{name:'Post'}">
                 <div class="post"></div>
            </router-link>
        </div>
        <div id="login">
            <el-avatar></el-avatar>
            <br/>
            <label>杂货店的阿猿</label>
            <br/>
            <label>我的帖子</label>
            <br/>
            <label>我的评论</label>
            <br/>
            <label>回复
            <span></span>
            </label>
        </div>
        <left-menu></left-menu>
        <right-menu ref="rightMenu"></right-menu>
    </div>
</template>

<script>
    import marked from "marked"
    import {reactive,ref} from "vue"
    import {loadComponent} from "../../utils/importUtil";
    export default {
        name: "Forum",
        components:{
            LeftMenu: loadComponent("LeftMenu"),
            RightMenu: loadComponent("RightMenu"),
            Music: loadComponent("Music"),
            ChildHead: loadComponent("ChildHead")
        },setup(){
            let listenMethod = ()=>{}

            return {
                listenMethod
            }
        },mounted() {
            this.listenMethod = setInterval(()=>{
                this.$refs.rightMenu.listenTop()
            },200)
        },unmounted() {
            clearInterval(this.listenMethod)
        }
    }
</script>
<style lang="less">

</style>
<style lang="less" scoped>
    #forum{
        color: white!important;
        background-image: url('../../assets/img/fenye.jpg');
        background-repeat: no-repeat;
        background-size: 100%;
        background-attachment: fixed;
        text-align: center;


        .addBtn{
            margin-top: 5vh;
            line-height: 5vw;
            font-size: 5vw;
            width: 5vw;
            height: 5vw;
            border-radius: 50%;
            background: @mainColor;
            box-shadow: @mainColor 1px 1.5px 1px 1px;
            border: 1px rgba(255, 255, 255, 0.75) solid;
            overflow: hidden;
            color: white;
            .frosted();
            &:hover{
                text-shadow: 0 0 10px #fff,
                0 0 20px #fff,
                0 0 30px #fff,
                0 0 40px #00a67c,
                0 0 70px #00a67c,
                0 0 80px #00a67c,
                0 0 100px #00a67c,
                0 0 150px #00a67c;
            }
        }
        #context {
            width: 60%;
            background: rgba(255, 255, 255, 0.95);
            min-height: 100vh;
            margin: 5vh auto;
            border-radius: 5px;
            position: relative;
            padding: 1vh 0;
            .item ,.post {
                width: 95%;
                background: #41308d;
                margin: 1vh auto;
                border-radius: 5px;
                position: relative;
            }
            .top .item{
                height: 5vh;
                span{
                    position: absolute;
                    left: 0;
                    width: 3vw;
                    text-align: center;
                    height: 4vh;
                    line-height: 4vh;
                    margin: 0.5vh 1vw;
                    border-radius: 5px;
                    background: #3f51b1;
                }
            }
            .post {
                height: 10vh;
                label{
                    text-align: center;
                    display: inline-block;
                    width: 20%;
                }
                label:nth-child(1){
                    width: 60%;
                }
            }
        }

        #login{
            position: fixed;
            width: 10vw;
            padding: 5vh 0;
            background: #101010;
            right: 20%;
            transform: translateX(10vw);
            top: 20vh;
            text-align: center;
            border-radius: 5px;
            label{
                position: relative;
                span{
                    background: red;
                    width: 1vh;
                    height: 1vh;
                    border-radius: 50%;
                    position: absolute;
                }
            }
        }

    }
</style>
