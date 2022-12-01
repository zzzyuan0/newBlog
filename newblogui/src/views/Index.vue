<template>
    <div id="index">
        <Heads  id="head" ref="heads" ></Heads>
        <div id="container" ref="container">
            <div id="articles">
                <div id="sticks">
                    <router-link :to="`/article/${item.id}`"  class="stick" :style="
                    {backgroundImage: `url(${topArticles.imgs[index].imgUrl})`,
                    width: topArticles.topArticle.length === 2 ? '48%' : '100%' }" v-for="(item, index) in topArticles.topArticle">
                        <div >
                            <div class="stickIcon">
                                置顶
                            </div>
                            <div class="title">{{item.title}}</div>
                            <div class="categories">
                                <label class="category"></label>
                            </div>
                        </div>
                    </router-link>
                </div>
                <router-link   v-for="(art,index) in showArticlesArr"  :to="`/article/${art.id}`"
                               v-if="imgPath.length != 0" class="article"
                               :style="{backgroundImage: 'url(' + imgPath[index].imgUrl + ')'}"
                               :id="index" :ref="'art' + index" >
                    <div>
                        <p class="title">{{art.title}}</p>
                    </div>
                </router-link>
            </div>
        </div>
        <left-menu id="leftMenu"></left-menu>
        <right-menu id="rightMenu" ref="rightMenu"></right-menu>
        <Music></Music>
        <user-menu id="user-menu"></user-menu>
        <div id="foot"></div>
    </div>
    <video src="../assets/video/sakura.mp4" style="width: 100%;height: 100%;object-fit: cover;position: absolute;top: 0;
    left: 0;z-index: -99;" autoplay="autoplay" loop="loop" muted="muted"></video>
</template>

<script>
import {loadComponent} from "../utils/importUtil"
import {getIndexApi, getTopArticle} from "../api/blog";
import {ref,reactive,onMounted,onUnmounted} from "vue"

export default {
  name: 'Index',
  components: {
      Heads: loadComponent("Head"),
      LeftMenu: loadComponent("LeftMenu"),
      RightMenu: loadComponent("RightMenu"),
      Music: loadComponent("Music"),
      UserMenu: loadComponent("UserMenu")
  },
  setup(){
      // 判断一个还是两个置顶文章
      const stickOneOrTwo = reactive({width:"48%"} )
// 动态加载文章
      let articles = reactive([{
          id:0,
          title:''
      }])
      let topArticles = reactive({})
      let showArticlesArr = reactive([])

      let imgPath = reactive([])


      getIndexApi().then(res => {
          articles = reactive( res.articleList)
          Object.assign(showArticlesArr, articles)
          // 响应式赋值
          Object.assign(imgPath,res.imgList)
      })

      getTopArticle().then(res => {
          Object.assign(topArticles, res)
          console.log(topArticles)
          if (res.topArticle.length == 1) {
              stickOneOrTwo.width = "100%"
          }
      })


      function autoShowArticles(){
          let len = 'art' + (showArticlesArr.length-1)
          let art = eval('this.$refs.' + len)  ;
          if(!art) return
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
          stickOneOrTwo,autoShowArticles,showArticlesArr,listenMethod,imgPath, topArticles
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
<style lang="less">

</style>
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
                transition: all 1s;
                #sticks,.article{
                    width: 90%;
                    position: relative;
                    height: 45vh;
                    margin: 0 auto;
                    z-index: 999;
                    pointer-events: auto;
                    transition: all 1s;
                    display: table;
                    .title{
                        width: 100%;
                        top: 50%;
                        transform: translate(0, -50%);
                        vertical-align: middle;
                        display: table-cell;
                        text-align: center;
                        margin: 0 auto;
                        position: absolute;
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
                    animation: 2s articleShow ease-in-out;
                    vertical-align: middle;
                    transition: all 1s;
                }
                .fun_hover() {
                    &:hover{
                        width:  95%;
                        height: 47vh;
                        &:after {
                            transform: scale(1.1);
                            content: "";
                            width: 101%;
                            height: 47vh;
                            position: absolute;
                            left: 0;
                            top: 0;
                            border-radius: 15px;
                            z-index: 2;
                        }

                    }
                }
                .article,.stick {
                    transition: all 1s;
                    transform: scale(1);
                    &:after{
                        content: "";
                        transform: scale(1);
                    }
                    .fun_hover();
                }
                #sticks{
                    height: auto;
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    .stick{
                        height: 45vh;
                        position: relative;
                        display: inline-block;
                        border: #c6246a 3px solid;
                        border-radius: 15px;
                        background-repeat: no-repeat;
                        background-size: cover;
                        overflow: hidden;
                        .stickIcon{
                            width: 15vw;
                            height: 2vw;
                            transform: rotate(-45deg) translate(-30%, -188%);
                            z-index: 999;
                            position: absolute;
                            overflow: hidden;
                            background: @mainColor;
                            color: #101010;
                            font-weight: bold;
                            text-align: center;
                            line-height: 2vw;
                            .frosted();
                        }
                        .fun_hover();
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
        #leftMenu,#rightMenu,#user-menu {
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
