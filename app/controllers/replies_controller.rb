# -*- coding: utf-8 -*-
class RepliesController < ApplicationController
  before_action :set_reply, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:new, :create]

  respond_to :html

  # # GET /replies
  # # GET /replies.json
  # def index
  #   @replies = Reply.all
  # end

  # # GET /replies/1
  # # GET /replies/1.json
  # def show
  # end

  # GET /replies/new
  def new
    @reply = Reply.new
    session[:post_id] = @post.id
  end

  # # GET /replies/1/edit
  # def edit
  # end

  # POST /replies
  # POST /replies.json
  def create
    @reply = Reply.new(reply_params)
    @reply.user = current_user if current_user
    @post = Post.find(session[:post_id])
    @reply.post = @post

    body = @reply.text
    jp_length = body.gsub(/[a-zA-Z0-9,.;:'"_\[\]<>\/= ]/, "").to_s.split(//).size
    body_length = body.split(//).size

    if jp_length < body_length * 0.2
      flash[:alert] = "スパム投稿防止の為、受け付けできません。"
      redirect_to root_path
    elsif @reply.save
      ReplyMailer.new_reply_email(@reply).deliver_now

      session[:post_id] = nil
      flash[:notice] = "情報提供ありがとうございました！"
      respond_with(@post, location: post_path(@post))
    else
      respond_with(@reply)
    end
  end

  # # PATCH/PUT /replies/1
  # # PATCH/PUT /replies/1.json
  # def update
  #   respond_to do |format|
  #     if @reply.update(reply_params)
  #       format.html { redirect_to @reply, notice: 'Reply was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @reply }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @reply.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /replies/1
  # # DELETE /replies/1.json
  # def destroy
  #   @reply.destroy
  #   respond_to do |format|
  #     format.html { redirect_to replies_url, notice: 'Reply was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reply
    @reply = Reply.find(params[:id])
  end

  def set_post
    if !params[:post_id].nil?
      @post = Post.find(params[:post_id])
    elsif !session[:post_id].nil?
      @post = Post.find(session[:post_id])
    else
      flash[:alert] = "Invalid Params"
      redirect_to posts_path
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reply_params
    params.require(:reply).permit(:user_id, :post_id, :text)
  end
end
