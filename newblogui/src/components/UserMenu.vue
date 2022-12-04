<template>
    <div id="user-menu" :class="{'hidden-menu':isMove}">
        <el-avatar id="avatar" :size="110">登录</el-avatar>
        <div id="option-icon">
            <i class="iconfont icon-gerenxinxi" title="个人信息"></i>
            <i class="iconfont icon-bofangjilu" title="用户记录"></i>
            <i class="iconfont icon-tuichu" title="注销登录"></i>
        </div>
        <div id="move-btn" @click="isMove = !isMove">
            <i class="iconfont icon-right2" :style="{transform: isMove ? 'rotate(90deg)': 'rotate(-90deg)'}"></i>
        </div>
    </div>
</template>

<script>
    import {ref} from "vue"
    export default {
        name: "UserMenu",
        setup(){
            let isMove = ref(true)

            return {
                isMove
            }
        }
    }
</script>

<style lang="less" scoped>
    #user-menu {
        position: absolute;
        width: 15vw;
        height: 15vw;
        background: @mainColor;
        z-index: 9999;
        border: 2px rgba(253, 244, 237, 0.24) solid;
        top: 0;
        left: 42.5vw;
        border-radius: 15px;
        overflow: hidden;
        transition: 2s;
        &.hidden-menu {
            transform: translate(0, -13.3vw);
            transition: 2s;
        }
        #option-icon {
            color: white;
            text-align: center;
            width: 15vw;
            height: 2vw;
        }
        #move-btn {
            background: rgba(16, 16, 16, 0.16);
            width: 15vw;
            height: 2vw;
            border-top: 1px seashell solid;
            .icon-right2 {
                color: rgba(255, 255, 255, 0.7);
                position: absolute;
                bottom: 0;
                font-size: 4rem;
                width: 4rem;
                height: 4rem;
                left: calc(50% - 2rem);
            }
        }
    }
</style>
<style lang="less">
    #user-menu {
        #avatar {
            margin: 2vw 0 0.5vw calc(7.5vw - 55px);
            background: rgba(63, 81, 177, 0.45);
            border: 2px silver solid;
            font-size: 5rem;
        }
        #option-icon {
            .iconfont {
                margin: 0 1vw;
                font-weight: bold;
                font-size: 3rem;
                color: #ffffff;
                &:hover {
                    color: #313d52;
                }
            }
        }
    }
</style>
