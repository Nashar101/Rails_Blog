# frozen_string_literal: true

class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  # GET /blogtexts/1/edit
  def edit
  end

  def create
    @comment = Comment.new(comment_params)
     respond_to do |format|
      if @comment.save
        format.html { redirect_to blogtext_path(:blog_id), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: Blogtext.find(params[:blog_id]) }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Comment.find(params[:id]).destroy!
    Reply.where("comment_id = ?", params[:id]).delete_all
    respond_to do |format|
      format.html { redirect_to blogtext_path(:blog_id), notice: "Comment was successfully destroyed." }
      format.json { render :show, status: :created, location: Blogtext.find(params[:blog_id]) }
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:username, :comment, :blog_id, :user_id)
  end
end
