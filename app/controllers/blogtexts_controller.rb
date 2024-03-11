class BlogtextsController < ApplicationController
  before_action :set_blogtext, only: %i[ show edit update destroy ]

  # GET /blogtexts or /blogtexts.json
  def index
    @blogtexts = Blogtext.all.sort_by{|x| x[:created_at]}.reverse!
  end

  # GET /blogtexts/1 or /blogtexts/1.json
  def show
    @comments = Comment.where("blogtext_id = ?", params[:id]).sort_by{|x| x[:created_at]}.reverse!
    @comment = Comment.new
  end

  # GET /blogtexts/new
  def new
    @blogtext = Blogtext.new
  end

  # GET /blogtexts/1/edit
  def edit
  end


  # POST /blogtexts or /blogtexts.json
  def create
    @blogtext = Blogtext.new(blogtext_params)

    respond_to do |format|
      if @blogtext.save
        format.html { redirect_to blogtext_url(@blogtext), notice: "Blogtext was successfully created." }
        format.json { render :show, status: :created, location: @blogtext }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @blogtext.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogtexts/1 or /blogtexts/1.json
  def update
    respond_to do |format|
      if @blogtext.update(blogtext_params)
        format.html { redirect_to blogtext_url(@blogtext), notice: "Blogtext was successfully updated." }
        format.json { render :show, status: :ok, location: @blogtext }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @blogtext.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogtexts/1 or /blogtexts/1.json
  def destroy
    @blogtext.destroy!

    respond_to do |format|
      format.html { redirect_to blogtexts_url, notice: "Blogtext was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def my_blog
    @blogtexts = Blogtext.where("user_id = ?", current_user.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blogtext
      @blogtext = Blogtext.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blogtext_params
      params.require(:blogtext).permit(:owner, :title, :blogpost, :user_id)
    end
end
