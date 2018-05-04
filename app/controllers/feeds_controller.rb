class FeedsController < ApplicationController
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
        @reply = FeedReply.new(feed_comment_id: params[:id], content: params[:content])
        @reply.save
        redirect_to action: 'index'
    end

    def reply_destroy
        reply_id = params[:id]
        FeedReply.destroy(reply_id)
        redirect_to action: 'index'
    end
end

