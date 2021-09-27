<template>

    <div id="mainPanel">
    </div>
    <div id="leftMenu"  :class="{move:isMove}" >
        <div v-show="!isMove" id="right" class="iconfont icon-right" @click="move">
        </div>
        <div id="left" v-show="isMove" >
            <i id="leftIcon" class="iconfont icon-right" @click="move"></i>
        </div>
    </div>

</template>

<script>
    import {reactive,ref,toRefs} from 'vue'
    export default {
        name: "LeftMenu",
        setup(){
            let isMove = ref(true);
            const move = () => {
                    isMove.value = !isMove.value
            }

            return {
                move,isMove
            }
        }
    }
</script>

<style lang="less" scoped>
    #mainPanel{
        display: flex;
        position: absolute;
        width: 19vw;
        height: 96vh;
        background: @mainColor;
        z-index: 999;
        top: 2vh;
        border-radius: 15px;

    }
    #leftMenu{
        z-index: 9999;
        position: absolute;
        display: flex;
        background: @mainColor;
        width: 10vw;
        min-height: 10vw;
        border-radius: 50%;
        border: 1px rgba(255, 255, 255, 0.75) solid;
        top: 50%;
        transform: translate(-80%,-50%);
        transition: 1s;
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
            min-height: 2vw;
            position: absolute;
            animation:1.5s  show;
        }
        #left {

            display: flex;
            width: 4vw;
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
                top: 50%;
                left: 30%;
                font-size: 4rem;
                transform: translate(-50%,-50%);
                animation:1.5s  show;
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

        &.move{
            transform: translate(-50%,-50%) !important;
        }
    }

</style>
