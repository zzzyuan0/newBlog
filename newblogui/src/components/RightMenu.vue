<template>

    <div id="rightMenu">
        <div v-if="!isTop" id="top" class="iconfont icon-top2" @click="moveTop" title="回到顶部"></div>
        <div v-if="isTop" id="default" class="iconfont icon-yuan"></div>
        <router-link :to="{name:'Index'}">
            <div class="iconfont icon-shouye" title="首页"></div>
        </router-link>

        <router-link :to="{name: 'Search'}">
            <div class="iconfont icon-sousuo" title="搜索"></div>
        </router-link>

        <router-link :to="{name: 'Forum'}">
            <div class="iconfont icon-luntan" title="论坛"></div>
        </router-link>

        <router-link :to="{name: 'FriendLink'}">
            <div class="iconfont icon-youlianguanli" title="友链"></div>
        </router-link>

        <router-link :to="{name: 'Search'}">
            <div class="iconfont icon-ganxingqu" title="分享"></div>
        </router-link>
    </div>
</template>

<script>
    import {watch,ref,reactive}  from "vue"
    export default {
        name: "RightMenu",
        // eslint-disable-next-line no-undef
        emits:{enterTop:null},
        setup(props,context){
            const isTop = ref(true)
            let listenMethod = ()=>{}
            const listenTop = ()=>{
                let scrollTop = document.body.scrollTop;
                isTop.value = scrollTop <= 50;
            }
            const moveTop = ()=>{
                document.body.scrollTop = 0
            }

            return {
                screenTop,listenTop,listenMethod,moveTop,isTop
            }
        },mounted() {
        },unmounted() {

        }

    }
</script>

<style lang="less" scoped>

    #rightMenu{
        position: absolute;
        display: flex;
        background: @mainColor;
        width: 2vw;
        min-height: 15vw;
        border: 1px rgba(255, 255, 255, 0.75) solid;
        border-radius: 15px;
        top: 50%;
        right: 0;
        transform: translate(-50%,0);
        box-shadow: @mainColor 2px 2.5px 3px 2px;
        overflow: hidden;
        display: block;
        .frosted();

        a{
            text-decoration: none;
            color: #101010;
        }

        div{
            font-size: 1.5vw;
            text-align: center;
            height: 3vw;
            line-height: 3vw;
            text-shadow: white 0.3px 0.3px 0.3px;
            &:hover{
                color: rgba(146, 143, 193, 0.98);
            }
        }

        #top,#default{
            z-index: 99;
            animation: 1.5s show;
        }
        @keyframes show {
            0%{
                opacity: 0;
            }
            100%{
                opacity: 100%;
            }
        }
    }



</style>
