class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.visible_to(current_user)
    @comments = @user.comments
  end
def index
  @users = User.top_rated.paginate(page: params[:page], per_page: 10)
end
end
