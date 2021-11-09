<template>
    <div class="v-waterfall-content" id="v-waterfall">
        <router-link to="#">
            <div v-for="(img,index) in waterfallList"
                 :key="index"
                 class="v-waterfall-item"
                 :style="{top:img.top+'px',left:img.left+'px',width:ImgWidth+'px',height:img.height}">
                <img :src="img.src" alt="">
                <span class="email">
                    <i class="iconfont icon-youxiang"></i>
                </span>
            <label>杂货店的阿猿</label>
                <br/>
                <br/>
                <p>闲来无事更新一下，分享技术与乐趣</p>
            </div>
        </router-link>

    </div>
</template>

<script>
    export default {
        name: "WaterFall",
        data(){
            return {
                waterfallList:[],
                imgArr:[
                    require('../assets/img/1back.png'),
                    require('../assets/img/1back.png'),
                    require('../assets/img/1back.png'),
                    require('../assets/img/1back.png'),
                    require('../assets/img/1back.png'),
                    require('../assets/img/1back.png'),
                    require('../assets/img/star.jpeg'),
                    require('../assets/img/star.jpeg'),
                    require('../assets/img/1back.png'),
                    require('../assets/img/1back.png'),
                    require('../assets/img/1back.png'),
                    require('../assets/img/1back.png'),
                    require('../assets/img/star.jpeg'),
                    require('../assets/img/star.jpeg'),
                    require('../assets/img/star.jpeg'),
                    require('../assets/img/1back.png'),
                    require('../assets/img/1back.png'),
                    require('../assets/img/star.jpeg'),
                    require('../assets/img/star.jpeg'),
                    require('../assets/img/star.jpeg'),
                    require('../assets/img/1back.png'),
                    require('../assets/img/1back.png'),
                    require('../assets/img/star.jpeg'),
                    require('../assets/img/star.jpeg'),
                ],
                ImgWidth:'',
                ImgCol:5,
                ImgRight:10,
                ImgBottom:150,
                deviationHeight:[],
                imgList:[],
                screenWidth:document.body.clientWidth,
            }
        },
        created() {
            for (let i = 0;i < this.imgArr.length;i++){
                this.imgList.push(this.imgArr[i]);
            }
        },
        mounted(){
            this.calculationWidth();
            const that = this;
            //挂载window的resize事件
            window.onresize = () => {
                return (() => {
                    window.screenWidth = document.body.clientWidth
                    that.screenWidth = window.screenWidth
                })()
            }
        },
        watch:{
            //使用vue的watch来处理窗口的变化
            screenWidth(val){
                // 为了避免频繁触发resize函数导致页面卡顿，使用定时器
                if(!this.timer){
                    // 一旦监听到的screenWidth值改变，就将其重新赋给data里的screenWidth
                    this.screenWidth = val
                    this.timer = true
                    let that = this
                    setTimeout(function(){
                        that.calculationWidth();  //重新计算图片宽度
                        that.timer = false
                    },400)
                }
            },
        },
        methods:{
            //计算每个图片的宽度
            calculationWidth(){
                this.ImgWidth = (this.screenWidth*0.6-this.ImgRight*this.ImgCol)/this.ImgCol;
                //初始化偏移高度数组
                this.deviationHeight = new Array(this.ImgCol);
                for (let i = 0;i < this.deviationHeight.length;i++){
                    this.deviationHeight[i] = 0;
                }
                this.imgPreloading()
            },
            //图片预加载
            imgPreloading(){
                this.waterfallList=[];
                for (let i = 0;i < this.imgList.length;i++){
                    let aImg = new Image();
                    aImg.src = this.imgList[i];
                    aImg.onload = aImg.onerror = ()=>{
                        let imgData = {};
                        imgData.height = this.ImgWidth/aImg.width*aImg.height; //按比例计算图片高度
                        imgData.src = this.imgList[i];
                        this.waterfallList.push(imgData);
                        this.rankImg(imgData); //渲染页面
                    }
                }
            },
            //瀑布流布局
            rankImg(imgData){
                let {ImgWidth,ImgRight,ImgBottom,deviationHeight} = this;
                let minIndex = this.filterMin();//获得高度最小的一列的下标
                imgData.top = deviationHeight[minIndex];//插入图片的top值
                imgData.left = minIndex*(ImgRight+ImgWidth);//插入图片的left值
                deviationHeight[minIndex] += imgData.height + ImgBottom;//更新当前列的高度
            },
            //找到最短的列并返回下标
            filterMin(){
                const min = Math.min.apply(null, this.deviationHeight);
                return this.deviationHeight.indexOf(min);
            },
        }
    }
</script>
<style lang="less" scoped>
    .v-waterfall-content{
        width: 100%;
        height: 100%;
        position: relative;
    }
    .v-waterfall-item{
        position: absolute;
        border: #101010 2px solid;
        padding-bottom: 10vh;
        border-radius: 5px;
        background: rgba(161, 122, 122, 0.65);
        margin-bottom: 1000px;
        text-align: center;
        color: white;
        .email{
            background: rgba(16, 16, 16, 0.91);
            position: absolute;
            width: 3vw;
            text-align: center;
            transform: rotate(0,0);
            z-index: 99;
            left: 0;
        }

        label {
             font-size: 1vw;
             font-weight: bold;
        }
    }

    .v-waterfall-item img{
        width: 100%;
        height: 100%;
    }

</style>
