class FavoritesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: @post)

    authorize favorite
    if favorite.save
      flash[:notice] = "Favorite created."
      redirect_to topic_post_path(@post.topic_id, @post )
    else
      flash[:alert] = "There was an error. :("
        redirect_to topic_post_path(@post.topic_id, @post )
      end

    end

    def destroy
      @post = Post.find(params[:post_id])
      favorite = current_user.favorited(@post)

      authorize favorite
      if favorite.destroy
        flash[:alert] = "Favorite destroyed."
        redirect_to topic_post_path(@post.topic_id, @post )
      else
        flash[:alert] = "There was an error. :("
          redirect_to topic_post_path(@post.topic_id, @post )
        end

      end

    end
