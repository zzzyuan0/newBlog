<template>

    <div id="rightMenu">
        <div v-if="!isTop" id="top" class="iconfont icon-top2" @click="moveTop" title="回到顶部"></div>
        <div v-if="isTop" id="default" class="iconfont icon-yuan"></div>
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

        &:before {
            content: "";
            position: absolute;
            background: inherit;
            z-index: -1;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            box-shadow: inset 0 0 2000px rgba(255, 255, 255, .5);
            filter: blur(10px);
            margin: -20px;
        }

        #top,#default{
            font-size: 1.5vw;
            position: absolute;
            height: 3vw;
            line-height: 3vw;
            top: 0;
            left: 50%;
            transform: translate(-50%,0);
            z-index: 99;
            animation: 1.5s show;
            &:hover{
                color: rgba(146, 143, 193, 0.98);
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
    }



</style>
