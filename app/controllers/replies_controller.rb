# frozen_string_literal: true

class RepliesController < ApplicationController

  def index

  end

  def new
    @reply = Reply.new
    @comment_id = params[:comment_id]
  end
  def create
    @reply = Reply.new(reply_params)
    respond_to do |format|
      if @reply.save
        format.html { redirect_to blogtext_path(params[:blogtext_id]), notice: "Reply was successfully created." }
        format.json { render :show, status: :created, location: Blogtext.find(params[:blogtext_id]) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy!
    redirect_to blogtext_path(params[:blogtext_id]), notice: "Reply was successfully deleted"
  end

  private
  def reply_params
    params.require(:reply).permit(:username, :reply, :comment_id, :user_id)
  end
end
