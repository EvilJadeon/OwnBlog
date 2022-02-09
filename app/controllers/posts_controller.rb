class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Post successfully created!'
    else
      render :new, danger: 'Post has not been created!'
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to posts_path, success: 'Post successfully updated!'
    else
      render :edit, danger: 'Post has not been updated!'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, success: 'Post successfully deleted!'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image)
  end
end
