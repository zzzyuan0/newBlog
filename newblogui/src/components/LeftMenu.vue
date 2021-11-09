<template>
<div id="leftMenu">
    <div id="mainPanel" :class="{mainPanel_move:!isMove}">
        <div id="title">杂货店的阿猿</div>
        <div id="avatarPanel">
            <div id="mybackgroud"></div>
            <div id="avatars">
                <el-avatar  id="avatar" :src="require('@/assets/img/avater.png')"></el-avatar>
                <div id="avatarBack" >
                    <div id="backChild">
                        <div></div>
                    </div>
                </div>

                <div id="account">
                    <a><i class="iconfont icon-youxiang" title="邮箱"></i></a>
                    <a><i class="iconfont icon-csdn" title="CSDN"></i></a>
                    <a><i class="iconfont icon-github" title="github"></i></a>
                </div>

            </div>

            <div id="sunDiv">
                <svg class="icon" id="sun" aria-hidden="true">
                    <use xlink:href="#icon-Taiyang"></use>
                </svg>
            </div>
            <div id="monDiv">
                <svg class="icon" id="mon" aria-hidden="true">
                    <use xlink:href="#icon-wanqingtian"></use>
                </svg>
            </div>
        </div>
        <div id="menu">
            <el-tabs type="border-card">
                <el-tab-pane name="el0">
                    <template #label>
                        <span slot="label"><i class="iconfont icon-fenlei" title="标签云"></i></span>
                    </template>
                    <router-link class="leftRow" :to="{name:'Login'}" v-for="(item,index) in leftData.categoryList">
                        <i class="el-icon-huo">100</i>
                        13456465
                    </router-link>
                </el-tab-pane>
                <el-tab-pane name="el1">
                    <template #label>
                        <span slot="label"><i class="iconfont icon-redu" title="热度排行"></i></span>
                    </template>
                    <router-link class="leftRow" :to="{name:'Login'}" v-for="(item,index) in leftData.articleHeatList">
                        <i class="el-icon-huo">100</i>
                        13456465
                    </router-link>
                </el-tab-pane>
                <el-tab-pane name="el2">
                    <template #label>
                        <span slot="label"><i class="iconfont icon-pinglun" title="最新评论"></i></span>
                    </template>
                    <router-link class="leftRow" :to="{name:'Login'}" v-for="(item,index) in leftData.commentHeatList">
                        <i class="el-icon-huo">100</i>
                        13456465
                    </router-link>
                </el-tab-pane>
            </el-tabs>
        </div>
    </div>
    <div id="leftMenuBtn"  :class="{move:isMove}" >
        <div v-show="!isMove" id="right" class="iconfont icon-right" @click="isMove = true">
        </div>
        <div id="left" v-show="isMove" >
            <i id="leftIcon" class="iconfont icon-right" @click="isMove = false"></i>
        </div>
    </div>
</div>


</template>

<script>
    import {reactive,ref,toRefs} from 'vue'
    export default {
        name: "LeftMenu",
        props:{
          leftData:Object
        },
        setup(props, context){
            let isMove = ref(true)
            let isHide= ref(false)

            return {
                isMove,isHide
            }
        }
    }
</script>
<style>
    .el-tabs--border-card , .el-tabs--border-card>.el-tabs__header,.el-tabs--border-card>.el-tabs__header .el-tabs__item.is-active{
        background: transparent !important;
        border: none !important;
    }
    .el-tabs--border-card>.el-tabs__content {
        padding: 0;
    }
    .el-tabs__nav{
        width: 100%;
        display: flex;
        justify-content: space-between;
    }
    .el-tabs--border-card>.el-tabs__content{
        padding-top: 5px!important;
    }
</style>
<style lang="less" scoped>
    #mainPanel{
        display: block;
        position: absolute;
        width: 19vw;
        height: 96vh;
        background: @mainColor;
        z-index: 999;
        top: 2vh;
        border-radius: 15px;
        transform: translate(0,0);
        transition: all 1s;
        box-shadow: rgb(11, 234, 235) 0px 0px 10px inset;

        #title{
            display: block;
            width: 100%;
            height: 10vh;
            border-bottom: #c5f80798 2px solid;
            font-size: 2vw;
            font-weight: bold;
            text-align: center;
            line-height: 10vh;

        }

        #avatarPanel{
            position: relative;
            width: 100%;
            height: 38vh;
            border-bottom: #c5f80798 2px solid;
            color: #101010;
            #mybackgroud{
                position: absolute;
                width: 100%;
                background-image: linear-gradient(to top, #3f51b1 0%, #5a55ae 13%, #7b5fac 25%, #8f6aae 38%, #a86aa4 50%, #cc6b8e 62%, #f18271 75%, #f3a469 87%, #f7c978 100%);
                min-height: 100%;
                opacity: 0.7;
                overflow: hidden;
                z-index: 99;
                &:after{
                    z-index: -1;
                    content: "";
                    width: 300px;
                    height: 300px;
                    background: @mainColor;
                    position: absolute;
                    left: 50%;
                    top:0;
                    transform: translate(-50%,-60%);
                    border-radius: 40%;
                    animation: wave 5s linear infinite;
                }
            }


            @widthBack:7.4vw;
            @heightBack:7.4vw;

            #avatar{
                width: 7vw;
                height: 7vw;
                position: absolute;
                left: calc(-3.5vw + @widthBack / 2);
                top: calc(-3.5vw + @heightBack / 2);
                z-index: 100;
                transform: rotateY(0);
            }

            #avatars{
                width: @widthBack;
                height: @heightBack;
                position: absolute;
                left: calc(8.5vw - @widthBack / 2);
                top: calc(19vh - @heightBack / 2);
                z-index: 999;
            }


            #account{
                background: rgba(255, 255, 255, 0.62);
                box-shadow: rgb(11, 157, 235) 0px 0px 10px inset;
                transform: rotateY(180deg);
                opacity: 0;
                i {
                    font-size: 2.5vw;
                }
                a{
                    position: absolute;
                    color: #07b4f8;
                    width: 3vw;
                    height: 3vw;
                    top: 0;
                    text-align: center;
                    left: 50%;
                    transform: translate(-50%,0.95vw);
                    border: 1px rgba(24, 36, 144, 0.45) solid;
                    border-radius: 50%;
                    line-height: 3vw;
                    box-shadow: #101010 1px 1px 2px ;
                    &:nth-child(2){
                        transform: translate(calc(0.865 * 3vw + -50%) ,calc( 2vw + 3vw));
                    }
                    &:nth-child(3){
                        transform: translate(calc(0.865 * -3vw + -50%),calc( 2vw + 3vw));
                    }
                    &:hover{
                        color: #5a55ae;
                        transition: 1s;
                        background: #b8b4e3;
                        width: 3.2vw;
                        height: 3.2vw;
                        opacity: 100;
                    }
                }
            }

            #account,#avatar,#avatarBack{
                transition: 1s;
                backface-visibility: hidden;
            }

            #avatars{
                &:hover{
                    #avatar,#avatarBack{
                        transform: rotateY(-180deg);
                    }
                    #account{
                        opacity: 100;
                        transform: rotateY(0deg);
                        width: calc(@widthBack + 2.5vw);
                        height: calc(@heightBack + 2.5vw);
                        transform: translate(-1.25vw,-1.25vw);
                    }
                }
            }



            #account,#avatarBack{
                width: @widthBack;
                height: @heightBack;
                position: absolute;
                z-index: 99;
                border-radius: 50%;
            }

            #avatarBack{
                background-image: linear-gradient(to right, #6a11cb 0%, #2575fc 100%);
                overflow: hidden;
                transform: rotateY(0);
                #backChild {
                    width: calc(@widthBack / 2);
                    height: calc(@heightBack / 2);
                    position: absolute;
                    div{
                        width: 2vw;
                        height: 2vw;
                        border-radius: 50%;
                        position: absolute;
                        background: #c5f807;
                        top: 0;
                    }
                    animation: rotateAvatar 5s infinite linear ;
                    transform-origin: right bottom;
                    box-shadow: rgb(11, 234, 235) 0px 0px 10px inset;
                }

            }

            #sunDiv{
                left: 2vw;
                top: calc(19vh - 6.5vw);
                width: 6.5vw;
                height: 6.5vw;
                position: absolute;
                animation: rotateAvatar 5s infinite linear ;
                transform-origin: right bottom;
            }
            #monDiv{
                left: 8.5vw;
                top: 19vh;
                width: 6.5vw;
                height: 6.5vw;
                position: absolute;
                animation: rotateAvatar 5s infinite linear ;
                transform-origin: left top;
            }
            #mon{
                position: absolute;
                right: 0;
                bottom: 0;
            }
            #sunDiv,#monDiv{
                z-index: 99;
            }
            #sun,#mon{
                animation: staticIcon 5s infinite linear ;
            }

        }

        #menu{
            .icon-pinglun,.icon-redu,.icon-fenlei{
                font-size: 2vw;
                color: #4a3a90;
                &:hover{
                    color: #9985d7;
                }
                &:focus{
                    color: #1e1058;
                }
            }
        }
    }

    .mainPanel_move{
        transform: translate(-100%,0) !important;
    }

    #leftMenuBtn{
        z-index: 9999;
        position: absolute;
        display: flex;
        background: @mainColor;
        width: 10vw;
        line-height: 10vw;
        min-height: 10vw;
        border-radius: 50%;
        border: 1px rgba(255, 255, 255, 0.75) solid;
        top: 50%;
        transform: translate(-80%,-50%);
        transition: all 1s;
        box-shadow: @mainColor 2px 2.5px 3px 2px;
        overflow: hidden;
        .frosted();

        #right{
            text-shadow: white 1px 1px 1px;
            color: #0d045c85;
            width: 2vw;
            font-size: 3vw;
            top: 50%;
            right: 2.5%;
            transform: translate(-50%,-50%);
            line-height: 2vw;
            min-height: 2vw;
            position: absolute;
            animation:1.5s  show;
        }
        #left {

            display: flex;
            width: 4vw;
            line-height: 4vw;
            min-height: 4vw;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-45%,-50%) rotate(180deg);
            border-radius: 50%;
            border: 2px rgba(255, 255, 255, 0.66) solid;
            color: #101010;
            overflow: hidden;
            i{
                text-shadow: white 1px 1px 1px;
                color: #0d045c85;
                position: absolute;
                top: 40%;
                left: 30%;
                font-size: 4rem;
                transform: translate(-50%,-50%);
                animation:1.5s  show;
            }
        }

        &.move{
            width: 4vw;
            min-height: 4vw;
            transform: translate(-50%,-50%) !important;
        }
    }

    .icon {
        width: 17em;
        height: 17em;
        vertical-align: -0.15em;
        fill: currentColor;
        overflow: hidden;
    }

    @keyframes sunAction {
        from {
            transform: rotate(0 deg) ;
        }
        to {
            transform: rotate(360 deg) ;
        }
    }


    @keyframes wave {
        100% {
            transform: translate(-50%,-60%) rotate(360deg);
        }

    }

    @keyframes show {
        0%{
            opacity: 0;
        }
        100%{
            opacity: 100%;
        }
    }

    @keyframes staticIcon {
        0%{
            transform: rotate(360deg);
        }
        100%{
            transform: rotate(0deg);
        }
    }
    @keyframes rotateAvatar{
        0%{
            transform: rotate(0);
        }
        100%{
            transform: rotate(360deg);
        }
    }

    .leftRow {
        display: block;
        padding: 1vh 1vw;
        color: black;
        font-size: 2vh;
        border-bottom: 1px solid black;
    }

</style>
