class FeedsController < ApplicationController
    before_action :authenticate_user!
    def index
        @feeds = Feed.all
        render 'index'
    end

    def new
        #new.html.erb를 보여줘라
        render 'new'
    end

    def create
        title = params[:title]
        content = params[:content]

        feed = Feed.new
        feed.title = title
        feed.content = content
        feed.user_id = current_user.id
        feed.save

        #index action으로 가서 실행해라
        redirect_to action: 'index'
    end

    def destroy
       feed_id = params[:id]
       Feed.destroy(feed_id)
       redirect_to action: 'index' 
    end

    def edit
        @feed = Feed.find(params[:id])
        render 'edit'
    end

    def update
        @feed_id = params[:id]
        feed = Feed.find(params[:id])
        feed.title = params[:title]
        feed.content = params[:content]
        feed.save
        redirect_to action: 'index'
    end

    def comment_create
        @comment = FeedComment.new(feed_id: params[:id], content: params[:content], user_id: current_user.id)
        @comment.save
        redirect_to action: 'index'
    end

    def comment_destroy
        comment_id = params[:id]
        FeedComment.destroy(comment_id)
        redirect_to action: 'index'
    end

    def reply_create
        @reply = FeedReply.new(feed_comment_id: params[:id], content: params[:content], user_id: current_user.id)
        @reply.save
        redirect_to action: 'index'
    end

    def reply_destroy
        reply_id = params[:id]
        FeedReply.destroy(reply_id)
        redirect_to action: 'index'
    end

    def comment_edit
        @feeds = Feed.all
        @comment_edit_id = params[:id].to_i
        render 'index'
    end

    def comment_update
        updated_comment = FeedComment.find(params[:id])
        updated_comment.content = params[:content]
        updated_comment.save
        redirect_to action: 'index'
    end

    def like
        feed_like_hash = {user_id: current_user.id, feed_id: params[:id]}
        like = FeedLike.where(feed_like_hash) #active record array 돌려줌. 그래서 destroy_all로 지움. 비어있을 경우를 확인할 수 있어 유용.
        if like.empty?
            FeedLike.create(feed_like_hash)
        else
            like.destroy_all #active record array는 pointer역할을 해줘서 model에서도 특정된 like가 사라짐.
        end
        redirect_to action: 'index'
    end

    def comment_like
        feed_comment_like_hash = {user_id: current_user.id, feed_comment_id: params[:id]}
        commentLike = FeedCommentLike.where(feed_comment_like_hash)
        if commentLike.empty?
            FeedCommentLike.create(feed_comment_like_hash)
        else
            commentLike.destroy_all
        end
        redirect_to action: 'index'
    end

    def reply_like
        feed_reply_like_hash = {user_id: current_user.id, feed_reply_id: params[:id]}
        replyLike = FeedReplyLike.where(feed_reply_like_hash)
        if replyLike.empty?
            FeedReplyLike.create(feed_reply_like_hash)
        else
            replyLike.destroy_all
        end
        redirect_to action: 'index'
    end

    def feed_follow
        feed_follow_hash = {follower_id: current_user.id, followee_id: Feed.find(params[:id]).user_id}
        follow = Follow.where(feed_follow_hash)
        if follow.empty?
            Follow.create(feed_follow_hash)
        else
            follow.destroy_all
        end
        redirect_to action: 'index'
    end
end

