class PostsController < ApplicationController
  def index
    @Post = Post.all
  end

  def new
    @Post = Post.new
  end

  def edit
    @Post = Post.find(params[:id])
  end

  def update
    @Post = Post.find(params[:id])

    if(@Post.update(Post_params))
      redirect_to @Post
    else
      render 'edit'
    end
  end

  def destroy
    @Post = Post.find(params[:id])

    @Post.destroy
    redirect_to :action => :index
  end

  def show
    @Post = Post.find(params[:id])
  end

  def create
    @Post = Post.new(Post_params)

    if(@Post.save)
      redirect_to @Post
    else
      render 'new'
    end
  end

  private def Post_params
    params.require(:Post).permit(:title, :description)
  end
end
