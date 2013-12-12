class FeedsController < ApplicationController
  
  before_action :authenticate_user!
  
   def create
      @topic = Topic.find(params[:topic_id])
      @feed = @topic.feeds.create(params[:feed].permit(:feeder, :text))
      @feed.user = current_user
      @feed.save

      respond_to do |format|
        format.js 
        format.html { 
          redirect_to topic_path(@topic) 
        }
      end
    end

    def destroy
      @topic = Topic.find(params[:topic_id])
      @feed = @topic.feeds.find(params[:id])
      @feed.destroy

      respond_to do |format|
        format.js
        format.html { 
          redirect_to topic_path(@topic)
        }
      end
    end

  end
