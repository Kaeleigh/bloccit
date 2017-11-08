class PostsController < ApplicationController
  def index
    # declare instance var @posts and assign it collection of Post obj
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
