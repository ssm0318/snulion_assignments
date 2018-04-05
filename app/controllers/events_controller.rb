class EventsController < ApplicationController
    def index
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
end
