<template>
    <div id="comment">
        <div class="comment-parent" v-for="comment in commentTree">
            <div class="info" style="display: flex">
                <el-avatar :src="comment.info.avatar">猿</el-avatar>
                <label style="margin: 2.5vh 1vw;position: relative;">{{comment.info.name}}</label>
            </div>
            <label class="comment-content">{{comment.comment.content}}</label>
            <div class="icon">
                {{comment.comment.createTime}}
                <i class="iconfont icon-dianzan" style="margin: 0 1vw" @click="addCommentHeat(comment.comment)">{{comment.comment.heat}}</i>
                <i class="iconfont icon-pinglun" style="margin: 0 1vw" @click="editComment(comment.comment.id)"></i>
            </div>
            <div class="child" v-if="comment.commentTrees != null">
                <div class="comment-child" v-for="item in comment.commentTrees">
                    <div class="info" style="display: flex">
                        <el-avatar :src="item.info.avatar">猿</el-avatar>
                        <label style="margin: 2.5vh 1vw;position: relative;">{{item.info.name}}</label>
                    </div>
                    <label class="comment-content">{{item.comment.content}}</label>
                    <div class="icon">
                        {{item.comment.createTime}}
                        <i class="iconfont icon-dianzan" style="margin: 0 1vw" @click="addCommentHeat(item.comment)">{{item.comment.heat}}</i>
                        <i class="iconfont icon-pinglun" style="margin: 0 1vw" @click="editComment(item.comment.id)"></i>
                    </div>
                </div>
            </div>
        </div>
        <div id="edit-comment" v-show="showEdit">
            <el-input
                    id="edit-text"
                    v-model="commentReq.content"
                    :rows="10"
                    type="textarea"
                    placeholder="请输入回复的内容"
            />
            <div id="edit-btn">
                <el-button type="primary" plain @click="saveComment">发送</el-button>
                <el-button type="warning" plain @click="showEdit = false">取消</el-button>
            </div>
        </div>
    </div>
</template>

<script>
    import {reactive, ref, onMounted} from "vue"
    import {getCommentApi, addCommentHeatApi, saveCommentApi} from "../api/user"
    export default {
        name: "Comment",
        props: {
            articleId: 0
        },
        setup(props, context) {
            let commentTree = reactive([])
            let showEdit = ref(false)
            let commentReq = reactive({
                userId: -1,
                content: "",
                articleId: props.articleId,
                parentId: 0,
                status: 0
            })
            onMounted(()=>{
                getCommentApi(props.articleId).then(res => {
                    Object.assign(commentTree, res)
                })
            })
            function addCommentHeat(comment) {
                 addCommentHeatApi({
                     id:  comment.id
                 }).then(res => {
                       comment.head++
                 })
            }
            function editComment(commentId) {
                 showEdit.value = true
                 commentReq.parentId = commentId
            }
            function saveComment() {
                 showEdit.value = false
                 saveCommentApi(commentReq).then(res =>{
                     console.log(res)
                 })
            }
            return {
                commentTree,props, addCommentHeat, showEdit, commentReq, editComment, saveComment
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
                *:hover {
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
        #edit-comment {
            position: fixed;
            width: 60vw;
            height: 60vh;
            background: rgba(255, 255, 255, 0.84);
            top: 30vh;
            border-radius: 10px;
            border: white 1px solid;
        }
    }
</style>
<style>
    #edit-comment #edit-text {
        width: 55vw;
        margin: 5vh 5vh;
        height: 40vh !important;
    }
    #edit-comment #edit-btn {
        float: right;
        margin-right: 5vw;
    }
</style>
