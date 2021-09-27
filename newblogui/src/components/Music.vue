<template>
    <div id="Music" :class="{chooseMusic:!isChoose}" @mouseenter="isChooseMethod"  @mouseleave="isChooseMethod" ref="musics">
        <div id="icon" v-show="!isChoose"></div>
        <div id="choose" v-show="isChoose" class="iconfont" :class="iconClass"  @click="switchMusic"></div>
    </div>
</template>

<script>
    import {defaultMusic} from "../conf/globalConf";
    import {ref} from "vue"
    export default {
        name: "Music",
        setup(){
            let isPlay = ref(true);
            let iconClass = ref('icon-24gf-pause2')
            let isChoose = ref(false);
            let audio = new Audio()
            audio.src = defaultMusic
            // audio.play()

            function isChooseMethod(){
                isChoose.value = !isChoose.value
            }

            function switchMusic() {
                isPlay.value = !isPlay.value
                if(isPlay.value){
                    audio.play()
                    iconClass.value = 'icon-24gf-pause2'
                }else {
                    audio.pause()
                    iconClass.value = 'icon-24gf-play'
                }
            }

            return {
                audio,isChoose,isPlay,isChooseMethod,iconClass,switchMusic
            }
       }
    }
</script>

<style lang="less" scoped>
    @import "src/conf/globalCss";

    .chooseMusic{
        animation: 5s  rotateIcon infinite Linear ;
    }
    #Music {
        width: 5vw;
        height: 6vw;
        position: fixed;
        right: 2vw;
        margin-top: 1vw;

    #icon,#choose{
        width: 5vw;
        min-height: 6vw;
        animation: 1s switchIcon;
    }
    #icon {
        .backImg(@musicDefaultImg);
    }
    #choose{
        .backImg(@musicChooseImg);
        text-align: center;
        line-height: 5vw;
        color: white;
        font-size: 2vw;
    }

    .backImg(@path){
        background-repeat: no-repeat;
        background-size: 100%;
        background-image: url(@path);
    }
    }

    @keyframes  switchIcon{
        0% {
            opacity: 0;
        }

        100% {
            opacity: 100%;
        }
    }

    @keyframes  rotateIcon{
        0% {
            transform: rotate(0);
        }
        100% {
            transform: rotate(360deg);
        }
    }

</style>
