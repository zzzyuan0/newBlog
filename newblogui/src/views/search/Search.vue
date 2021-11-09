<template>
    <div id="search">
        <child-head>
                <template v-slot>
                    <el-input id="searchBtn" placeholder="请输入你需要搜索的" style="width: 40vw;left: 50%;transform: translate(-50%,0)">
                        <template #prefix>
                            <i class="el-input__icon el-icon-search"></i>
                        </template>
                    </el-input>
                </template>
        </child-head>
        <div id="searchBar">
            <div style="min-height: 10vh" v-for="(item,index) in checkList">
                <el-divider v-if="index !== 'time' " ></el-divider>
                <label v-if="index !== 'time'" >{{item.name}}</label>
                <div class="date-picker" v-if="index === 'time'">
                    <div class="block">
                        <el-date-picker
                                v-model="item.arr"
                                type="daterange"
                                range-separator="To"
                                start-placeholder="Start date"
                                end-placeholder="End date"
                                format="YYYY/MM/DD"
                                value-format="YYYY-MM-DD"
                        >
                        </el-date-picker>
                    </div>
                </div>
                <el-checkbox-group v-else v-model="item.arr">
                    <div class="opsBar">
                        <el-checkbox v-for="options in item.ops" :label="options" />
                    </div>
                </el-checkbox-group>
            </div>
        </div>
        <div id="content">
            <div class="searchResult">
                <div class="title">
                </div>
                <div class="context">
                </div>
            </div>
         <div class="searchResult">
                <div class="title">
                </div>
                <div class="context">
                </div>
            </div>
         <div class="searchResult">
                <div class="title">
                </div>
                <div class="context">
                </div>
            </div>
           <div class="searchResult">
                <div class="title">
                </div>
                <div class="context">
                </div>
            </div>
        </div>
        <left-menu></left-menu>
        <right-menu ref="rightMenu"></right-menu>

    </div>
</template>

<script>

    import {loadComponent} from "../../utils/importUtil";
    import {ref,toRefs,reactive} from "vue"

    export default {
        name: "Search",
        components:{
            LeftMenu: loadComponent("LeftMenu"),
            RightMenu: loadComponent("RightMenu"),
            Music: loadComponent("Music"),
            ChildHead: loadComponent("ChildHead")
        },
        setup(){
            const checkList = ref({
               time:{
                   name:'时间',
                   arr:[],
                   ops:["选项A","选项B","选项C","选项C","选项C","选项C","选项C","选项C","选项C","选项C","选项C","选项C","选项C","选项C","选项C","选项C","选项C"]
                } ,
                lang:{
                   name:'语言',
                    arr:[],
                    ops:["选项A","选项B"]
                },
                first:{
                   name:'一级分类',
                    arr:[],
                    ops:["选项A","选项B"]
                },
                second:{
                   name:'二级分类',
                    arr:[],
                    ops:["选项A","选项B"]
                }
            })

            let listenMethod = ()=>{}

            return {
                checkList,listenMethod
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
    .el-checkbox__inner {
        background: transparent;
    }
    #searchBtn{
        opacity: 0.5;
        background: @mainColor;
        box-shadow: @mainColor 1px 1.5px 2px 1px;
        border: 1px rgba(255, 255, 255, 0.75) solid;
        overflow: hidden;
        caret-color: white;
        .frosted()
    }
    .el-divider--horizontal{
        margin: 10px 0;
    }
    .el-checkbox-group{
        display: inline-block;
        margin-left: 1vw;
    }
    .el-checkbox__label{
        color: white;
    }
    .date-picker{
        display: inline-block;
        position: absolute;
        left: 50%;
        transform: translate(-50%,0);
        line-height: 10vh;

        .el-range-editor.el-input__inner{
            background: @mainColor!important;
            input{
                background: transparent;
                border: solid 1px white;
                border-radius: 5px;
                color: white;
            }
        }
    }
</style>

<style lang="less" scoped>

    #search{

        #searchBar{
            color: white;
            background: #c5f80720;
            min-height: 20vh;
            width: 80vw;
            margin: 0 auto;
            border-radius: 5px;
            padding: 0 1vw;
            line-height: 5vh;
            border: white 1px solid;
            position: relative;
            label{
                font-size: 3vh;
                font-weight: bold;
                display: inline-block;
                height: inherit;
            }
            .opsBar{
                width: 90vw;
            }
        }

        #content{
            .searchResult{
                width: 60%;
                min-height: 20vh;
                background: black;
                margin: 0 auto;
                margin-top: 1vh;
                position: relative;
                .title{
                    position: absolute;
                    background: #c5f807;
                    width: 40%;
                    min-height: 100%;
                }
            }
        }


    }

</style>
