class MeowsController < ApplicationController
  # /posts/:post_id/meows
  def create
    # Find the Post that we're "meowing" at
    post = Post.find(params[:post_id])
    # Build a Meow by the current user for the post
    meow = current_user.meows.build(post: post)

    if meow.save
      redirect_to :back, notice: "We heard your Meow!"
    else
      redirect_to :back
    end
  end

  def destroy
    current_user.meows.destroy(params[:id])
    redirect_to :back, notice: "All evidence of your meowing has been destroyed!"
  end
end
