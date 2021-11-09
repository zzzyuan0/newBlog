<template>
        <div id = "head" ref="head">
                <div id="rss" title="RSS订阅">
                        <i class="iconfont icon-dingyue-copy-copy-copy"></i>
                </div>

                <div id="content">
                        <div class="card" v-for="item in card" :key="item"   @mouseover="choose(item.id)">
                                <div class="front" :id="item.id"></div>
                                <div class="back" :id = "item.id + 'Back'">
                                        <router-link :to="{name:item.path}">
                                                <span>
                                                        {{item.title}}
                                                </span>
                                        </router-link>
                                </div>
                        </div>
                </div>
        </div>
</template>

<script>
        import {ref,reactive} from "vue"
        import {ChangeThemes} from "../utils/chooseThemes"
    export default {
        name: "Head",
        setup(){
                let headHeight = ref(0)
                const card = reactive([{
                        id:'one',
                        title:'首页',
                        path: 'Index'
                },{
                        id:'two',
                        title: '检索',
                        path: 'Search'
                },{
                        id:'three',
                        title: '论坛',
                        path: 'Forum'
                },{
                        id:'four',
                        title: '友链',
                        path: 'FriendLink'
                },{
                        id:'five',
                        title: '分享',
                        path: 'Search'
                }])
                const choose = (e) => {
                        ChangeThemes(e)
                }
                return {
                        choose,card,headHeight
                }
            },mounted() {
                this.headHeight = this.$refs.head.offsetHeight;
            }
    }
</script>

<style lang="less" scoped>
        @import "../conf/globalCss";
        #head{
                position: relative;
        }
        #rss{
                width: 0;
                height: 0;
                border-width: 3vw 3vw 3vw 3vw;
                border-style: solid;
                border-color:  @mainColor transparent transparent @mainColor ;
                z-index: 999;
                position: absolute;
                background: transparent;
                .frosted();
                i {
                        transform:  rotate(90deg) translate(-90%, 90%);
                        width: 3vw;
                        min-height: 3vw;
                        position: absolute;
                        text-shadow: white 1px 1px 1px;
                        color: rgba(114, 161, 39, 0.52);
                        font-size: 3vw;
                        z-index: 9999;
                        &:hover{
                                color: darkblue;
                                text-shadow: rgba(60, 54, 111, 0.97) 1px 1px 1px;
                        }
                }
        }
        #content{
                position: absolute;
                width: 100%;
                min-height: 80%;
                top: 10%;
                display: flex;
                align-items: center;
                justify-content: center;

                .card{
                        width: 10vw;
                        margin-left: 4%;
                        margin-right: 4%;
                        min-height: 20vw;
                        max-height: 20vw;
                        position: relative;
                        transform-style: preserve-3d;
                        perspective: 600px;
                        z-index: 999;
                        .front,.back{
                                border-radius: 15px;
                                min-height: 20vw;
                                width: 10vw;
                                position: absolute;
                                overflow: hidden;
                        }
                       .front{
                               transform: rotateY(0);
                       }
                        .back{
                                backface-visibility: hidden;
                                transform: rotateY(180deg);
                                a {
                                        z-index: 999;
                                        span {
                                                position: absolute;
                                                display: inline-block;
                                                width: 20vw;
                                                min-height: 7vw;
                                                top: 50%;
                                                transform: translate(-25%, -50%) rotate(7deg);
                                                background-image: linear-gradient(to top, #d299c240 0%, #fef9d755 100%);
                                                text-align: center;
                                                color: white;
                                                font-size: 5vw;
                                                font-family: cursive;
                                                text-shadow: 6px 2px 2px #333;
                                                transition: 1.5s;
                                        }
                                        &:hover span{
                                                transform: translate(-30%,-50%) rotate(3deg);
                                                font-size: 5.5vw;
                                                width: 25vw;
                                                min-height: 8vw;
                                                background-image: linear-gradient(to top, #d299c260 0%, #fef9d795 100%);
                                        }
                                }
                        }
                        .front,.back{
                                transition: 1.5s;
                        }
                        #two,#four,#twoBack,#fourBack{
                                margin-top: 20%;
                        }
                        .imageBack(@color,@path){
                                background-repeat: no-repeat;
                                background-size: 100%;
                                box-shadow: @color 2px 2px 5px 1px;
                                background-image: url(@path);
                        }
                        #one{
                                .imageBack(@oneColor,@oneImg);
                        }
                        #oneBack{
                                .imageBack(@oneColor,@oneBackImg);
                        }
                        #two{
                                .imageBack(@twoColor,@twoImg);
                        }
                        #twoBack{
                                .imageBack(@twoColor,@twoBackImg);
                        }
                        #three{
                                .imageBack(@threeColor,@threeImg);
                        }
                        #threeBack{
                                .imageBack(@threeColor,@threeBackImg);
                        }
                        #fourBack{
                                .imageBack(@fourColor,@fourBackImg);
                        }
                        #four{
                                .imageBack(@fourColor,@fourImg);
                        }
                        #fiveBack{
                                .imageBack(@fiveColor,@fiveBackImg);
                        }
                        #five{
                                .imageBack(@fiveColor,@fiveImg);
                        }
                        &:hover{
                                .front{
                                        transform: rotateY(-180deg);
                                }
                                .back{
                                        transform: rotateY(0deg);
                                }

                        }

                }
        }

</style>
