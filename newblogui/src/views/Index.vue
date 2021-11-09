<template>
    <div id="index">
        <Heads  id="head" ref="heads" ></Heads>
        <div id="container" ref="container">
            <div id="articles">
                <div id="sticks">
                    <router-link to="/article" class="stick" :style="stickOneOrTwo">
                        <div >
                            <div class="stickIcon">
                                置顶
                            </div>
                            <div class="title">第一章</div>
                            <div class="categories">
                                <label class="category"></label>
                            </div>
                        </div>
                    </router-link>
                    <router-link to="/article" class="stick" :style="stickOneOrTwo">
                        <div>
                            <div class="stickIcon" >
                                置顶
                            </div>
                        </div>
                    </router-link>

                </div>
                <router-link to="/article">
                    <div class="article" v-for="(art,index1) in showArticlesArr" :id="index1" :ref="'art' + index1">
                        {{art.id}}
                    </div>
                </router-link>
            </div>
        </div>
        <left-menu id="leftMenu"></left-menu>
        <right-menu id="rightMenu" ref="rightMenu"></right-menu>
        <Music></Music>
        <div id="foot">
        </div>
    </div>
    <video src="../assets/video/sakura.mp4" style="width: 100%;height: 100%;object-fit: cover;position: absolute;top: 0;left: 0;z-index: -99;" autoplay="autoplay" loop="loop" muted="muted"></video>
</template>

<script>
import {loadComponent} from "../utils/importUtil"
import {ref,reactive} from "vue"
import Head from "../components/Head";

export default {
  name: 'Index',
  components: {
      Heads: Head,
      LeftMenu: loadComponent("LeftMenu"),
      RightMenu: loadComponent("RightMenu"),
      Music: loadComponent("Music")
  },
  setup(){
      // 判断一个还是两个置顶文章
      const stickOneOrTwo = ref({width:"48%"} )

      // 动态加载文章
      const articles = [{
          id: 1,
          title: '文章一'
      },{
          id: 2,
          title: '文章一'
      },{
          id: 3,
          title: '文章一'
      },{
          id: 4,
          title: '文章一'
      },{
          id: 5,
          title: '文章一'
      },{
          id: 6,
          title: '文章一'
      }]
      let showArticlesArr = reactive([])
      showArticlesArr.push(articles[0])
      function autoShowArticles(){
          let len = 'art' + (showArticlesArr.length-1)
          let art = eval('this.$refs.' + len)  ;
          let headHeight = this.$refs.heads.headHeight
          let artTop = art.offsetTop
          let scrollTop = document.body.scrollTop;
          let innerHeight = document.body.offsetHeight;

          if( (headHeight + artTop + headHeight/3 < scrollTop + innerHeight) && articles.length > showArticlesArr.length){
               this.showArticlesArr.push(articles[showArticlesArr.length])
          }else if(articles.length <= showArticlesArr.length){
              this.$refs.container.style.paddingBottom = "5vw";
          }


      }

      let listenMethod = ()=>{}

      return {
          stickOneOrTwo,autoShowArticles,showArticlesArr,listenMethod
      }
  },mounted() {
        this.listenMethod = setInterval(()=>{
            this.$refs.rightMenu.listenTop()
            this.autoShowArticles()
        },200)
    },unmounted() {
        clearInterval(this.listenMethod)
    }
}
</script>

<style lang="less" scoped>
    /*@import url('https://fonts.googleapis.com/css2?family=Ma+Shan+Zheng&family=Stick+No+Bills&display=swap');*/
    #index{
        display: flex;
        flex-direction: column;
        min-height: 100%;
        height: auto;
        width: 100%;
        z-index: -1;
        .fun_color(){
            border: 2px @mainColor solid;
    }

        #container{
            min-height: auto;
            padding-bottom: 45vh;
            z-index: 1;
            #articles{
                width: 60vw;
                background: @mainColor;
                border-radius: 15px;
                height: 100%;
                margin: 0 auto;
                padding-top: 5vh;
                padding-bottom: 5vh;
                position: relative;
                z-index: -1;
                #sticks,.article{
                    width: 90%;
                    position: relative;
                    height: 45vh;
                    margin: 0 auto;
                    display: block;
                    z-index: 999;
                    pointer-events: auto;
                    .title{
                        width: 100%;
                        min-height: 100%;
                        line-height: 45vh;
                        text-align: center;
                        margin: 0 auto;
                        position: absolute;
                        align-items: center;
                        color: whitesmoke;
                        font-size: 3vw;
                        font-family: 微软雅黑;
                        text-shadow: #41308d 1px 1px 1px 1px 1px;
                        text-shadow: 0 0 10px #f69191,0 0 20px #f69191,0 0 30px #f69191,0 0 40px #f69191;
                        z-index: 3;
                    }
                }
                .article{
                    z-index: 9999;
                    margin-top: 5vh;
                    border: #c6246a 3px solid;
                    border-radius: 15px;
                    background-repeat: no-repeat;
                    background-size: cover;
                    overflow: hidden;
                    background-image: url("https://tva1.sinaimg.cn/large/0072Vf1pgy1foxkfgr4ckj31hc0u0h0r");
                    animation: 2s articleShow ease-in-out;
                    vertical-align: middle;
                }
                .article,.stick {
                    transition: all 1s;
                    &:after{
                        content: "";
                        transform: scale(1);
                        transition: all 1s;
                    }
                    &:hover{
                        width:  95%;
                        height: 47vh;
                        &:after {
                            transition: all 1s;
                            transform: scale(1.1);
                            content: "";
                            width: 101%;
                            height: 47vh;
                            position: absolute;
                            left: 0;
                            top: 0;
                            border-radius: 15px;
                            background: inherit;
                            position: absolute;
                            -webkit-filter: blur(4px);
                            -moz-filter: blur(4px);
                            -ms-filter: blur(4px);
                            filter: blur(4px);
                            z-index: 2;
                        }

                    }
                }
                #sticks{
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    .stick{
                        position: relative;
                        display: inline-block;
                        border: #c6246a 3px solid;
                        border-radius: 15px;
                        height: 100%;
                        background-repeat: no-repeat;
                        background-size: cover;
                        overflow: hidden;
                        background-image: url("https://tva1.sinaimg.cn/large/0072Vf1pgy1foxkfgr4ckj31hc0u0h0r");
                        .stickIcon{
                            width: 15vw;
                            height: 2vw;
                            transform: rotate(-45deg) translate(-30%, -188%);
                            z-index: 999;
                            position: absolute;
                            overflow: hidden;
                            color: #101010;
                            font-weight: bold;
                            text-align: center;
                            line-height: 2vw;
                            .frosted();
                        }
                        &:first-child{
                            animation: 1.5s articleFShow;
                        }
                        &:nth-child(2){
                            animation: 1.5s articleZShow;
                        }
                    }
                }

            }
        }
        #head{
            flex: 0;
            .fun_color();
            min-height: 60vh;
        }
        #foot{
            flex: 0;
            .fun_color();
            min-height: 20vh;
        }
        #leftMenu,#rightMenu {
            z-index: 999;
        }
    }


    @keyframes articleShow {
        0%{
            transform: translate(100vw,0);
        }

        80%{
            transform: translate(-1vw,0);
        }
        90%{
            transform: translate(1vw,0);
        }
        100%{
            transform: translate(0,0);
        }
    }

    @keyframes articleZShow {
        0%{
            transform: translate(100vw,0);
        }

        100%{
            transform: translate(0,0);
        }
    }

    @keyframes chooseAnimal {
        0%{
            transform: scale(1);
        }
        100%{
            transform: scale(1.1);
        }
    }

    @keyframes articleFShow {
        0%{
            transform: translate(-100vw,0);
        }
        100%{
            transform: translate(0,0);
        }
    }

</style>
