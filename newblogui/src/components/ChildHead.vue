<template>
    <div id="goTo" @click="goTo"> &lt;  </div>
    <div id="childHead">
        <slot></slot>
    </div>
</template>

<script>
    export default {
        name: "childHead",
        setup(){
            function goTo() {
                window.history.back()
            }

            return{
                goTo
            }
        }
    }
</script>

<style lang="less" scoped>
    #childHead{
        min-height: 20vh;
        top: 0;
        width: 100%;
        /*background: rgba(31, 33, 24, 0.19);*/
        background-image: url(@childHeadBackGround);
        position: relative;
        line-height: 20vh;
    }

    #goTo{
        position: fixed;
        width: 3vw;
        min-height: 4vh;
        border-radius: 15px;
        margin: 5px 5px;
        background: @mainColor;
        box-shadow: @mainColor 1px 1.5px 2px 1px;
        border: 1px rgba(255, 255, 255, 0.75) solid;
        overflow: hidden;
        font-size: 2vw;
        text-align: center;
        z-index: 9999;
        color: white !important;
        .frosted()
    }
</style>
