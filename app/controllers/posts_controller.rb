# -*- coding: utf-8 -*-
class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    if params[:keyword]
      @posts = Post.where("title LIKE ? OR location LIKE ? OR model LIKE ? OR chassis_number LIKE ? OR registration_number LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%", "%#{params[:keyword]}%").order("created_at DESC").page(params[:page]).per(10)
       # Post.arel_table[:title].matches("%#{params[:keyword]}%") OR Post.arel_table[:location].matches("%#{params[:keyword]}%") OR Post.arel_table[:model].matches("%#{params[:keyword]}%") OR Post.arel_table[:chassis_number].matches("%#{params[:keyword]}%") OR Post.arel_table[:registration_number].matches("%#{params[:keyword]}%") OR Post.arel_table[:features].matches("%#{params[:keyword]}%") OR Post.arel_table[:situation].matches("%#{params[:keyword]}%")
    else
      @posts = Post.order("created_at DESC").page(params[:page]).per(10)
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @description = @post.title
    @keywords = @post.model
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.images.build
  end

  # GET /posts/1/edit
  def edit
    @post.images.build
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user

    respond_to do |format|
      if @post.save
        if params[:post][:images]
          params[:post][:images].each_with_index { |image, i|
            return if i > 2
            @post.images.create(user: current_user, image: image)
          }
        end

        format.html { redirect_to @post, notice: t("activerecord.models.post") + t("messages.successfully_created") }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: t("activerecord.models.post") + t("messages.successfully_updated") }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: t("activerecord.models.post") + t("messages.successfully_deleted") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :title, :location, :date, :model, :chassis_number, :registration_number, :features, :situation)
    end
end
