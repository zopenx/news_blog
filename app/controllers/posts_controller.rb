class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :try_update_by_edit_count, only: %i[update]


  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  def self.new_post_by_day
    # @posts = Post.where("created_at >?", Time.zone.parse("2021-06-17 09:00am"))# Date.today)
    @posts = Post.where("created_at >?", DateTime.now.ago(1.day)).all
    #1.day.ago.to_date).all
  end

  def self.new_post_by_week
    # @posts = Post.where("created_at >?", Time.zone.parse("2021-06-17 09:00am"))# Date.today)
    @posts = Post.where("created_at >?", DateTime.now.ago(1.week)).all
    #1.day.ago.to_date).all
  end
  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Пост успешно создвн." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Пост обновлен." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Пост удален." }
      format.json { head :no_content }
    end
  end


  private
    def try_update_by_edit_count
      @post = Post.find(params[:id])
      @post.edit_count = @post.edit_count+1
    # Something else
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :edit_count)
    end
end
