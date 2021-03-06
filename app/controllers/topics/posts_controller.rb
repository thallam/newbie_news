class Topics::PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])
    @comments = @post.comments
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @post = Post.new
    authorize @post
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @post = current_user.posts.build(params.require(:post).permit(:title, :body))
    @post.topic = @topic
    authorize @post

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
  end
  def update
    @topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:id])
    authorize @post
    if @post.update_attributes(params.require(:post).permit(:title, :body))
      flash[:notice] = "Post was updated"
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @topic = Topic.find(params[:topic_id])

    authorize @post
    if @post.destroy
      flash[:notice] = "The post was destroyed"
      redirect_to @topic
    else
      flash[:error] = "There was an error destroying the post"
      redirect_to [@topic, @post]
    end


  end
end
