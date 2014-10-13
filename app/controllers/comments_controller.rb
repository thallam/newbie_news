class CommentsController < ApplicationController
<<<<<<< HEAD
respond_to :html, :js
  def show
  end

  def new
    @post = Post.find(params[:post_id])
    authorize @comment
  end

  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    @comment = current_user.comments.build(comment_params.merge(post_id: params[:post_id]))
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment created."

    else
      flash[:alert] = "There was an error <br> #{@comment.errors.to_a}"
    end
    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end
  end

  def update
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment


    if @comment.destroy
      flash[:notice] = "The comment was destroyed"

    else
      flash[:error] = "There was an error destroying the comment"

    end

    respond_with(@comment) do |format|
      format.html { redirect_to [@post.topic, @post] }
    end
    end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
