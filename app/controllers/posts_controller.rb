class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path, notice: "Post created successfully."
    else
      flash.now[:notice] = "There were some errors with your Post."
      render :new
    end
  end

  protected
  def post_params
    params.require(:post).permit(:image, :description)
  end
end
