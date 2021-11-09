<template>
    <div id="friendLink">
        <child-head>
            <template v-slot>
                <button class="addBtn" @click="isShowAdd = true" title="申请友链">+</button>
            </template>
        </child-head>
        <div id="context">
            <water-fall></water-fall>
        </div>
        <div class="add" v-show="isShowAdd">
            <span @click="isShowAdd = false"><i class="el-icon-close"></i></span>
            <h2>申请加入友链</h2>
            <el-form id="form" :rules="formRules" :model="friendData" ref="submitFriendForm" label-width="100px">
                <el-form-item label-width="0px" prop="none">
                    <el-input size="small" auto-complete="off" v-model="friendData.avatar"
                              placeholder="输入你的头像链接">
                        <template #prefix>
                            <el-icon class="iconfont icon-github"></el-icon>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item label-width="0px" prop="name">
                    <el-input size="small" auto-complete="off" v-model="friendData.name"
                              placeholder="输入你的昵称">
                        <template #prefix>
                            <el-icon class="iconfont icon-github"></el-icon>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item label-width="0px" prop="email">
                    <el-input size="small" auto-complete="off" v-model="friendData.email"
                              placeholder="输入你的邮箱地址">
                        <template #prefix>
                            <el-icon class="iconfont icon-github"></el-icon>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item  label-width="0px" prop="link">
                    <el-input placeholder="输入你的博客地址" auto-complete="off" size="small"
                              v-model="friendData.link">
                        <template #prefix>
                            <el-icon class="iconfont icon-github"></el-icon>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item inline-message="true" label-width="0px" prop="none">
                    <el-input type="textarea" placeholder="输入你对自己博客的描述" auto-complete="off" v-model="friendData.des"
                              size="small">
                        <template #prefix>
                            <el-icon class="iconfont icon-github"></el-icon>
                        </template>
                    </el-input>
                </el-form-item>
                <el-form-item label-width="0px">
                    <el-button class="submit" type="primary" @click="submitForm">
                        申请
                    </el-button>
                </el-form-item>
            </el-form>
        </div>
        <left-menu></left-menu>
        <right-menu ref="rightMenu"></right-menu>
    </div>

</template>

<script>
    import {reactive,ref} from "vue"
    import {loadComponent} from "../../utils/importUtil";
    export default {
        name: "FriendLink",
        components:{
            LeftMenu: loadComponent("LeftMenu"),
            RightMenu: loadComponent("RightMenu"),
            Music: loadComponent("Music"),
            ChildHead: loadComponent("ChildHead"),
            WaterFall: loadComponent("WaterFall")
        },
        setup(){
            // 申请友链输入的数据
            let friendData = reactive( {
                name: '',
                email: '',
                link: '',
                des: '',
                avatar: '',
            })
            // 友链申请数据验证规则
            let formRules = reactive({
                name: [{
                    required: true, //必填
                    message: '请输入用户昵称', //提示信息
                    trigger: 'blur' //出发校验
                }, {
                    min: 0,
                    max: 30, // min,max则校验了我们要求的字符串长度
                    message: '用户名长度在0-30个字符之间',
                    trigger: 'blur'
                }],
                email: [{
                    required: true, //必填
                    message: '请输入邮箱地址', //提示信息
                    trigger: 'blur' //出发校验
                }],
                link: [{
                    required: true, //必填
                    message: '请输入博客地址', //提示信息
                    trigger: 'blur' //出发校验
                }],
                none: [{
                }]
            })
            // form表单绑定对象
            let submitFriendForm = ref(null)
            // 提交验证
            function submitForm() {
                submitFriendForm.value.validate((valid) => {
                        console.log(valid , data)
                });
            }

            // 是否显示申请加入友链
            let isShowAdd = ref(false)
            let isClickCloseBtn = ref(false)
            let listenMethod = ()=>{}
            return {
                friendData,formRules,submitForm,submitFriendForm,isShowAdd,isClickCloseBtn,listenMethod
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
    body{

        background-image: url(@childBackGround);
        background-repeat: no-repeat;
        background-size: 100%;
        background-attachment: fixed;
    }
</style>
<style lang="less" scoped>



    #friendLink{
        color: white!important;
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

    }


    .add{
        width: 18vw;
        position: fixed;
        right: 50%;
        transform: translateX(50%);
        z-index: 999;
        text-align: center;
        padding: 4vh 4vw;
        background: #10101098;
        border-radius: 5px;
        border: white 1px solid;

        span {
            position: absolute;
            right: 1vh;
            top: 1vh;
            font-size: 2vw;
            &:hover{
                color: #bdbcbc;
            }
        }

        #form{
            margin: 0 auto;
            width: 15vw;
            position: relative;
            button{
                position: absolute;
                right: 50%;
                transform: translateX(50%);
                width: 5vw;
            }
        }
    }

    #context{
        width: 60%;
        margin: 0 auto;
        min-height: 100vh;
        position: relative;
    }






</style>
