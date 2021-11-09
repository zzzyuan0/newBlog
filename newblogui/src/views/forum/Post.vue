<template>
    <div id="forum">
        <child-head>
            <template v-slot>
                <button class="addBtn" @click="isShowAdd = true" title="发表评论">+</button>
            </template>
        </child-head>
        <div id="context">
            <table border="1" style="border-collapse: collapse;">
                <tr class="row" v-for="item in 4">
                    <th class="col user">
                        <span class="tig">楼主</span>
                        <img src="https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.2008php.com%2F09_Website_appreciate%2F10-07-11%2F1278861720_g.jpg&refer=http%3A%2F%2Fwww.2008php.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1638871458&t=fd940e7292a12b7c526fa72579fd7100">
                        <br/>
                        <label>杂货店的阿猿<span class="level">L1</span></label>
                    </th>
                    <th class="col">Modnwad</th>
                </tr>
            </table>
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
        name: "Post",
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

            table {
                margin: 0 auto;
            }

            .row {
                color: #101010;
                .col{
                    width: 48vw;
                    height: 20vh;
                }
                .user {
                    width: 10vw;
                    background: #d5d5d5;
                    position: relative;
                    overflow: hidden;
                    .tig{
                        position: absolute;
                        width: 6vw;
                        height: 4vh;
                        line-height: 4vh;
                        background: white;
                        transform: rotate(-45deg) translate(-1.5vw,-1vw);
                    }
                    .level{
                        background: #44ce2c;
                        padding: 2px;
                        border-radius: 2px;
                    }
                    img {
                        width: 8vw;
                        height: 8vw;
                        border: 1px solid black;
                        margin: 2vw 2vw;
                    }
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
