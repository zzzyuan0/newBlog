<template>
    <div id="comment">
        <div class="comment-parent" v-for="comment in commentTree">
            <div class="info">
                <el-avatar :src="comment.info.avatar">猿</el-avatar>
                <label>{{comment.info.name}}</label>
            </div>
            <label class="comment-content">{{comment.comment.content}}</label>
            <div class="icon">
                {{comment.comment.createTime}}
                <i class="iconfont icon-dianzan" style="margin: 0 1vw">{{comment.comment.heat}}</i>
                <i class="iconfont icon-pinglun" style="margin: 0 1vw"></i>
            </div>
            <div class="child" v-if="comment.commentTrees != null">
                <div class="comment-child" v-for="item in comment.commentTrees">
                    <div class="info">
                        <el-avatar :src="item.info.avatar">猿</el-avatar>
                        <label>{{item.info.name}}</label>
                    </div>
                    <label class="comment-content">{{item.comment.content}}</label>
                    <div class="icon">
                        {{item.comment.createTime}}
                        <i class="iconfont icon-dianzan" style="margin: 0 1vw" @click="addCommentHeat">{{item.comment.heat}}</i>
                        <i class="iconfont icon-pinglun" style="margin: 0 1vw"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import {reactive, onMounted} from "vue"
    import {getCommentApi, addCommentHeatApi} from "../api/user"
    export default {
        name: "Comment",
        props: {
            articleId: String
        },
        setup(props, context) {
            let commentTree = reactive([])
            onMounted(()=>{
                getCommentApi(props.articleId).then(res => {
                    console.log(res)
                    Object.assign(commentTree, res)
                })
            })
            function addCommentHeat(commentId) {
                 addCommentHeatApi(commentId).then(res => {

                 })
            }
            return {
                commentTree,props, addCommentHeat
            }
        }
    }
</script>

<style lang="less" scoped>
    #comment {
        width: 60vw;
        background: rgba(255, 255, 255, 0.24);
        margin: 0 auto;
        height: auto;
        padding: 1vh 0;
        border-radius: 5px;

        .comment-parent {
            margin: 1vh auto;
            min-height: 15vh;
            width: 50vw;
            height: auto;
            background: rgba(153, 145, 145, 0.49);
            border-radius: 15px;
            border: white 1px solid;
            line-height: 5vh;
            padding: 5px;
            .icon {
                float: right;
                .icon-dianzan:hover {
                    color: #656060;
                }
            }
            .comment-content {
                margin: 1vh 1vw;
            }
            .child {
                border: rgba(36, 30, 30, 0.51) 2px solid;
                width: 45vw;
                margin: 0 2.5vw;
                padding: 1vh 1vw;
            }
            .comment-child {
                width: 40vw;
                margin: 0 2.5vw;
                line-height: 5vh;
                border-top: #101010 1px solid;
                border-bottom: #101010 1px solid;
                padding: 5px;
                background: rgba(5, 5, 5, 0.6);
                height: auto;
                border-radius: 5px;
            }
        }
    }

</style>
