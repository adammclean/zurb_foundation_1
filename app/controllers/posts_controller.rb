class PostsController < ApplicationController
  respond_to :html, :json

  before_action :lookup_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      respond_with @post, flash[:notice] = 'Post successfully created'
    else
      render :new, flash[:error] = @post.errors.messages
    end
  end

  def update
    if @post.update_attributes post_params
      respond_with @post, flash[:notice] = 'Post successfully updated'
    else
      render :edit, flash[:error] = @post.errors.messages
    end
  end

  def destroy
    if @post.destroy
      flash[:notice] = 'Post successfully deleted'
      redirect_to posts_path
    else
      render :edit, flash[:error] = ['Unable to delete Post.']
    end
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :content,
      :hero_image
    )
  end

  def lookup_post
    @post = Post.find params[:id]
  end
end
