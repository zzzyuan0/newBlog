<template>
    <child-head></child-head>
    <!-- 创建封装容器 -->
    <div class="container"  :class="{'penal-right-active':!isLogin}" id="container">

        <!-- 注册页面 -->
        <div class="form-container sign-up-container">
            <el-form
                    ref="registerRef"
                    :model="userInfo"
                    :rules="rules"
                    label-width="120px"
                    class="ruleForm"
            >
                <h1>注册</h1>
                <el-form-item label="用户名" prop="name">
                    <el-input v-model="userInfo.name" type="text" name="userName" id="userName" placeholder="输入用户名"/>
                </el-form-item>
                <el-form-item label="邮箱" prop="email">
                    <el-input type="email" name="email" class="email" v-model="userInfo.email" placeholder="请输入邮箱"/>
                </el-form-item>
                <div id="code-panel">
                    <div style="display: inline-block;position: relative">
                        <el-form-item label="验证码" prop="code">
                            <el-input v-model="userInfo.code" type="code" name="code"  id="code" placeholder="输入验证码..."/>
                        </el-form-item>
                        <button id="btnCode" :style="{backgroundColor: !clickSendCode ? '#f09180' : ''}"
                                @click="verificationCode" :disabled="!clickSendCode">获取验证码
                            <span v-show="!clickSendCode">({{countDown}})</span>
                        </button>
                    </div>

                </div>
                <el-form-item label="密码" prop="password">
                    <el-input type="password" name="password" class="password" v-model="userInfo.password" placeholder="请输入密码"/>
                </el-form-item>
                <el-form-item label="重复密码" prop="rePassword">
                    <el-input type="password" name="re-password"  id="re-password" v-model="userInfo.rePassword" placeholder="重复输入密码"/>
                </el-form-item>
                <el-form-item label-width="0px">
                    <el-button type="primary"  @click="register(registerRef)">注册</el-button>
                </el-form-item>
            </el-form>
        </div>

        <!-- 登录页面 -->
        <div class="form-container sign-in-container">

            <el-form
                    ref="LoginRef"
                    :model="userInfo"
                    :rules="rules"
                    label-width="120px"
                    class="demo-ruleForm"
            >
                <h1>登录</h1>
                <el-form-item label="邮箱" prop="email">
                    <el-input type="email" name="email" class="email" v-model="userInfo.email" placeholder="请输入邮箱"/>
                </el-form-item>
                <el-form-item label="密码" prop="password">
                    <el-input type="password" name="password" class="password" v-model="userInfo.password" placeholder="请输入密码"/>
                </el-form-item>
                <a href="#" class="forget">忘记密码</a>
                <el-button @click="login(LoginRef)">登录</el-button>
            </el-form>

        </div>

        <!-- 覆盖容器 -->
        <div class="overlay-container">
            <div class="overlay">

                <!-- 覆盖左边 -->
                <div class="overlay-penal overlay-left-container">
                    <h1>欢迎加入！</h1>
                    <p>
                        如果你已经有账号了可以点击下方登录
                    </p>
                    <button class="ghost" id="signUp" @click="isLogin=true">登录</button>
                </div>

                <!-- 覆盖右边 -->
                <div class="overlay-penal overlay-right-container">
                    <h1>欢迎回来！</h1>
                    <p>
                        如果你还没有账号可以点击下方注册
                    </p>
                    <button class="ghost" id="signIn" @click="isLogin=false">注册</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import {loadComponent} from "../../utils/importUtil";
    import {postSendCaptchaApi} from "../../api/threeServer"
    import {ref,reactive} from "vue"
    import {useStore} from "vuex"
    import { ElForm } from 'element-plus'
    import {postLoginApi, postRegisterApi} from "../../api/common";
    import {useRouter} from "vue-router";



    export default {
        name: "Login",
        components:{
            ChildHead: loadComponent("ChildHead")
        },
        setup(){

            let isLogin = ref(true)
            let router = useRouter()
            let countDown = ref(0);

            let clickSendCode = ref(true)

            const userInfo = reactive({
                name: '',
                email:'',
                code:'',
                password:'',
                rePassword:''
            })

            function verificationCode() {
                countDown.value = 60
                clickSendCode.value = false

                postSendCaptchaApi(userInfo.email).then(res => {

                }).catch(err => {

                })

                function countDownFun(){
                    countDown.value--

                    if(countDown.value === 0) {
                        clickSendCode.value = true
                    } else {
                        setTimeout( ()=>{countDownFun()},1000)
                    }
                }

                setTimeout( countDownFun(),1000)

            }

// 验证数据
            const formSize = ref('')
            const ruleFormRef = ref()

            // 邮箱自定义验证
            const validateEmail = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请输入邮箱'))
                } else {
                    const regEmail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
                    if(!regEmail.test(value)){
                        callback(new Error('邮箱格式不正确'))
                    } else {
                        callback()
                    }
                }
            }

            // 邮箱自定义验证
            const validateRePassword = (rule, value, callback) => {
                if (value === '') {
                    callback(new Error('请重复输入密码'))
                } else {
                    if(value !== userInfo.password) callback(new Error('你输入的两次密码不一致'))
                    callback()
                }
            }

            let rules = reactive({
                name: [
                    {
                        required: true,
                        message: '用户名不为空',
                        trigger: 'blur',
                    },
                    {
                        min: 3,
                        max: 20,
                        message: '长度应该为3-20字符之间',
                        trigger: 'blur',
                    },
                ],
                email: [
                    {
                        validator: validateEmail,
                        trigger: 'blur'
                    }, {
                        required: true,
                        message: '邮箱不为空',
                        trigger: 'blur',
                    },
                ],
                code: [
                    {
                        required: true,
                        message: '验证码不为空',
                        trigger: 'blur',
                    },
                ],
                password:[
                    {
                        required: true,
                        message: '密码不为空',
                        trigger: 'blur',
                    },
                    {
                        min: 6,
                        max: 20,
                        message: '长度应该为6-20字符之间',
                        trigger: 'blur',
                    },
                ],
                rePassword: [
                    {
                        validator: validateRePassword,
                        trigger: 'blur'
                    },
                    {
                        required: true,
                        message: '请重复输入密码',
                        trigger: 'blur',
                    },
                ],
            })

            const registerRef = ref(null)
            const LoginRef = ref(null)

            const  register = (formEl) => {
                if (!formEl) return
                formEl.validate((valid) => {
                    if (valid) {
                        console.log('submit!')
                        postRegisterApi(userInfo).then( res => {
                            isLogin.value = true
                        })
                    } else {
                        console.log('error submit!')
                        return false
                    }
                })
            }

            let store = useStore()
            const login = (formEl) => {
                let isRight = 0
                if (!formEl) return
                formEl.validateField(["email","password"],(valid) => {
                    if (!valid) {
                        isRight++
                    }
                })
                if(isRight === 2){
                    postLoginApi({
                        email: userInfo.email,
                        password: userInfo.password
                    }).then(res => {
                        store.commit("SET_TOKEN",res.token)
                        store.commit("SET_USER_INFO",res.userInfo)
                        router.back()
                    })
                }
            }

            return {
                ruleFormRef,userInfo,
                isLogin,verificationCode,countDown,
                clickSendCode,rules,register,registerRef,LoginRef,login
            }

        }
    }
</script>
<style>
    .el-form-item__label {
        width: 80px!important;
    }
    #code{
        width: 50%;
    }
    .el-form-item{
        margin: 10px 0 !important;
    }
</style>
<style lang="less" scoped>
    * {
        padding:0;
        margin:0;
        box-sizing: border-box;
    }
    body{
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #F6F5F7;
    }
    button {
        outline: none;
        border: 1px solid #FF4B2B;
        border-radius: 20px;
        background-color: #FF4B2B;
        padding: 10px 40px;
        font-size: 12px;
        text-transform: uppercase;
        color: white;
        transition: transform 85ms ease-in;
    }
    h1 {
        text-transform: capitalize;
        font-size: 30px;
    }
    p{
        margin: 10px 0 30px;
    }
    button:active {
        transform: scale(.95);
    }
    .ghost {
        background-color: transparent;
        border-color: white;
    }



    .container{
        position: relative;
        width: 768px;
        max-width: 100%;
        min-height: 480px;
        background-color: white;
        box-shadow: 0 14px 28px rgba(0, 0, 0, .25), 0 10px 10px rgba(0, 0, 0, .22);
        border-radius: 10px;
        overflow: hidden;
        margin: 20px auto;
    }

    .form-container{
        position: absolute;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: white;
        height: 100%;
        width: 50%;
        padding: 0 40px;
        transition: all .65s ease-in-out;
    }
    .form-container form{
        width: 100%;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
    }
    .form-container input {
        width: 100%;
        height: 40px;
        margin: 8px 0;
        background-color: #EEEEEE;
        border: none;
        font-size: 14px;
        padding: 0 20px;
    }
    .sign-in-container{
        z-index: 10;
    }
    .sign-up-container{
        z-index: 5;
    }

    .social-container {
        display: flex;
    }
    .social-container a{
        width: 40px;
        height: 40px;
        border-radius: 50%;
        border: 1px solid #ddd;
        line-height: 40px;
        text-align: center;
        color: #333;
        margin: 20px 8px;
    }
    .social-container a:hover {
        background-color: #222F3E;
        color: white;
        border-color: #CBCBCC;
    }

    .overlay-container {
        position: absolute;
        right: 0;
        width: 50%;
        height: 100%;
        background-color: tomato;
        overflow: hidden;
        transition: transform .65s ease-in-out;
        z-index: 100;
    }
    .overlay {
        position: absolute;
        display: flex;
        left: -100%;
        width: 200%;
        height: 100%;
        background: linear-gradient(to right, #FF4B2D, #FF426B);
    }

    .overlay-penal {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        width: 50%;
        padding: 0 40px;
        text-align: center;
        color: white;
        font-size: 12px;
    }
    .forget {
        height: 20px;
        color: #9AA9B7;
        text-decoration: none;
        margin: 5px 0 15px;
        font-size: 12px;
        text-transform: capitalize;
    }
    .forget:hover {
        border-bottom: 2px tomato solid;
    }

    .overlay-left-container {
        transform: translateX(10%);
        transition: transform .65s ease-in-out;
    }
    .overlay-right-container {
        transform: translateX(0);
        transition: transform .65s ease-in-out;
    }

    .container.penal-right-active .sign-in-container {
        z-index: 5;
        transform: translateX(100%);
    }

    .container.penal-right-active .sign-up-container {
        z-index: 10;
        transform: translateX(100%);
    }

    .container.penal-right-active .overlay-container {
        transform: translateX(-100%);
    }
    .container.penal-right-active .overlay {
        transform: translateX(50%);
    }
    .container.penal-right-active .overlay-left-container {
        transform: translateX(0);
    }
    .container.penal-right-active .overlay-right-container {
        transform: translateX(-10%);
    }

    #code-panel{
        display: inline-block;
        #code{
            width: 50%;
            margin-right: 2%;
        }
        #btnCode{
            padding: 5px;
            top: 50%;
            transform: translate(0, -50%);
            right: 0;
            width: 80px;
            position: absolute;
        }
    }


</style>
