class EventsController < ApplicationController
    before_action :authenticate_user!
    def index
        if !user_signed_in?
            redirect_to "users/sign_in"
            end
        @events = Event.all
        render 'index'
    end

    def new
        render 'new'
    end

    def create
        datetime = params[:datetime]
        title = params[:title]

        event = Event.new
        event.datetime = datetime
        event.title = title
        event.user_id = current_user.id
        event.save

        #index action으로 가서 실행해라
        redirect_to action: 'index'
    end

    def destroy
        event_id = params[:id]
        Event.destroy(event_id)
        redirect_to action: 'index'
    end

    def edit
        @event = Event.find(params[:id])
        render 'edit'
    end

    def update
        event_id = params[:id]
        event = Event.find(event_id)
        event.datetime = params[:datetime]
        event.title = params[:title]
        event.save
        redirect_to action: 'index'
    end
 
    def comment_create
        @comment = EventComment.new(event_id: params[:id], content: params[:content], user_id: current_user.id)
        @comment.save
        redirect_to action: 'index'
    end

    def comment_destroy
        comment_id = params[:id]
        EventComment.destroy(comment_id)
        redirect_to action: 'index'
    end

    def reply_create
        @reply = EventReply.new(event_comment_id: params[:id], content: params[:content], user_id: current_user.id)
        @reply.save
        redirect_to action: 'index'
    end

    def reply_destroy
        reply_id = params[:id]
        EventReply.destroy(reply_id)
        redirect_to action: 'index'
    end

    def comment_edit
        @events = Event.all
        @updating_comment_id = params[:id].to_i
        render 'index'
    end

    def comment_update
        updated_comment = EventComment.find(params[:id])
        updated_comment.content = params[:content]
        updated_comment.save
        redirect_to action: 'index'
    end

    def like
        event_like_hash = {user_id: current_user.id, event_id: params[:id]}
        like = EventLike.where(event_like_hash) #active record array 돌려줌. 그래서 destroy_all로 지움. 비어있을 경우를 확인할 수 있어 유용.
        if like.empty?
            EventLike.create(event_like_hash)
        else
            like.destroy_all #active record array는 pointer역할을 해줘서 model에서도 특정된 like가 사라짐.
        end
        redirect_to action: 'index'
    end

    def comment_like
        event_comment_like_hash = {user_id: current_user.id, event_comment_id: params[:id]}
        commentLike = EventCommentLike.where(event_comment_like_hash)
        if commentLike.empty?
            EventCommentLike.create(event_comment_like_hash)
        else
            commentLike.destroy_all
        end
        redirect_to action: 'index'
    end

    def event_follow
        event_follow_hash = {follower_id: current_user.id, followee_id: Event.find(params[:id]).user_id}
        follow = Follow.where(event_follow_hash)
        if follow.empty?
            Follow.create(event_follow_hash)
        else
            follow.destroy_all
        end
        redirect_to action: 'index'
    end
end
