# frozen_string_literal: true

class BlogsController < ApplicationController

  def index
    @my_blogs = Blogtext.where("user_id = ?", current_user.id).sort_by{|x| x[:created_at]}
  end

  def show
    @blogs = Blogtext.where("user_id = ?", params[:id])
    @user = User.find(params[:id])
  end
end
