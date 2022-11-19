<template>
    <div id="comment">
        <div class="comment-parent" v-for="comment in commentTree">
            <div class="info" style="display: flex">
                <el-avatar :src="comment.info.avatar">猿</el-avatar>
                <label style="margin: 2.5vh 1vw;position: relative;">{{comment.info.name}}</label>
            </div>
            <div class="comment-content">{{comment.comment.content}}</div>
            <div class="icon">
                {{comment.comment.createTime}}
                <i class="iconfont icon-dianzan" style="margin: 0 1vw" :style="{color: comment.comment.isLike ? '#f09180' : ''}"
                   @click="saveCommentHeat(comment.comment)">{{comment.comment.heat}}</i>
                <i class="iconfont icon-pinglun" style="margin: 0 1vw" @click="editComment(comment.comment.id)"></i>
                <i class="iconfont icon-lajitong" style="margin: 0 1vw" v-if="comment.info.id === userId" @click="deleteComment(comment.comment.id)"></i>
            </div>
            <div class="child" v-if="comment.commentList != null">
                <div class="comment-child" v-for="item in comment.commentList">
                    <div class="info" style="display: flex">
                        <el-avatar :src="item.info.avatar">猿</el-avatar>
                        <label style="margin: 2.5vh 1vw;position: relative;">{{item.info.name}}</label>
                    </div>
                    <div class="comment-content">
                        <span class="reviewer" style="background: rgba(198,193,193,0.34)" v-if="commentMap.get(item.comment.parentId) != null">
                        回复 {{commentMap.get(item.comment.parentId)}} :
                    </span>
                        {{item.comment.content}}
                    </div>
                    <div class="icon">
                        {{item.comment.createTime}}
                        <i class="iconfont icon-dianzan" style="margin: 0 1vw" :style="{color: item.comment.isLike ? '#f09180' : ''}"
                           @click="saveCommentHeat(item.comment)">{{item.comment.heat}}</i>
                        <i class="iconfont icon-pinglun" style="margin: 0 1vw" @click="editComment(item.comment.id)"></i>
                        <i class="iconfont icon-lajitong" style="margin: 0 1vw" v-if="item.info.id === userId"
                           @click="deleteComment(item.comment.id)"></i>
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
    import {getCommentApi, addCommentHeatApi, saveCommentApi, deleteCommentHeatApi, deleteCommentApi} from "../api/user"
    import {useStore} from "vuex"
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
            let userId = ref(-1)
            let commentMap = reactive(new Map())
            const store = useStore()
            onMounted(()=>{
                let userInfo = store.getters.getUser
                if(userInfo && userInfo.id) {
                    userId.value = userInfo.id
                }
                getComment()
            })
            function getComment() {
                getCommentApi({
                    articleId: props.articleId,
                    userId: userId.value
                }).then(res => {
                    if(res) {
                        for (let i = 0; i < res.length ; i++) {
                            for (let j = 0; res[i].commentList && j < res[i].commentList.length; j++) {
                                commentMap.set(res[i].commentList[j].comment.id, res[i].commentList[j].info.name)
                            }
                        }
                    }
                    Object.assign(commentTree, res)
                })
            }
            // 点赞以及取消赞
            function saveCommentHeat(comment) {
                 if (comment.isLike) {
                     deleteCommentHeatApi({
                         commentId: comment.id,
                         userId: userId.value
                     }).then(res => {
                         comment.isLike = false
                         comment.heat = comment.heat - 1
                     })
                 } else {
                     addCommentHeatApi({
                         commentId: comment.id,
                         userId: userId.value
                     }).then(res => {
                         comment.isLike = true
                         comment.heat = comment.heat + 1
                     })
                 }

            }
            // 回复评论
            function editComment(commentId) {
                 showEdit.value = true
                 commentReq.parentId = commentId
            }
            // 保存评论
            function saveComment() {
                showEdit.value = false
                commentReq.userId = userId.value
                 saveCommentApi(commentReq).then(res =>{
                     getComment()
                 })
            }
            // 删除评论
            function deleteComment(commentId) {
                deleteCommentApi({
                    commentId: commentId,
                    userId: userId.value
                }).then(res => {
                    getComment()
                })
            }
            return {
                commentTree,props, saveCommentHeat, showEdit, commentReq,
                editComment, saveComment, commentMap, deleteComment, userId
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
                text-align: right;
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
