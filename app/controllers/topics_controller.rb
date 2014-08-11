class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    authorize @topics
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    authorize @topic
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
    authorize @topic
    if @topic.save
      flash[:notice] = "topic was saved."
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the topic."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end
  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
      flash[:notice] = "topic was updated"
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the topic."
      render :edit
    end

  end
end
