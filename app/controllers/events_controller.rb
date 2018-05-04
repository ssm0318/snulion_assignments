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
end
