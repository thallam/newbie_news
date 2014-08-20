class CommentsController < ApplicationController

def show
end

def new
  @post = Post.find(params[:post_id])
  @topic = Topic.find(params[:topic_id])
  authorize @comment
end

def create
  @post = Post.find(params[:post_id])
  @topic = Topic.find(params[:topic_id])
  @comment = current_user.comments.build(comment_params.merge(post_id: params[:post_id]))
  authorize @comment
   binding.pry

  if @comment.save
    flash[:notice] = "Comment created."
    redirect_to topic_post_path(id: @post.id)
  else
    flash[:alert] = "There was an error <br> #{@comment.errors.to_a}"
    redirect_to topic_post_path(id: @post.id)
  end

end

def update
end

def destroy
end


  protected
  def comment_params
    params.require(:comment).permit(:body)
  end


end
