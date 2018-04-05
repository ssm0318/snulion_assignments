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
end

