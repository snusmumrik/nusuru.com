class UsersController < ApplicationController
  before_action :set_user

  # GET /users/1
  # GET /users/1.json
  def show
    @posts = Post.where(["user_id = ?", @user.id]).order("created_at DESC").page(params[:page]).per(10)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end
end
