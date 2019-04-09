class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  before_action :authenticate_user!, except: :index


  # 조회수
  impressionist actions: [:show]
  # , unique: [:ip_address] 서비스 시 위의 코드와 결합

  def hashtags
    tag = Tag.find_by(name: params[:name])
    @posts = tag.posts
  end

  # GET /posts
  # GET /posts.json
  def index

    if params[:category_id]
      @posts = Post.where(:category_id => params[:category_id]).order('likes_count DESC')
    else
      @posts = Post.all.order('likes_count DESC')
    end

  end

  def search
   @posts = @category.posts
  end


  # GET /posts/1
  # GET /posts/1.json
  def show
    @post_attachments = @post.post_attachments.all
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post_attachment = @post.post_attachments.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.user_email = current_user.email

    respond_to do |format|
      if @post.save
        params[:post_attachments]['avatar'].each do |a|
          @post_attachment = @post.post_attachments.create!(:avatar => a)
        end
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
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
        params[:post_attachments]['avatar'].each do |a|
          @post_attachment = @post.post_attachments.create!(:avatar => a)
        end
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
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
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
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
      params.require(:post).permit(:category_id, :title, :temperature, :time, :description, :image, :remove_image, :image_cache, ingredients_attributes:[:id, :content, :_destroy], steps_attributes:[:id, :direction, :_destroy], post_attachments_attributes: [:id, :post_id, :avatar])
    end
end
