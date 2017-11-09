class PostsController < ApplicationController
  def index
    # declare instance var @posts and assign it collection of Post obj
    @posts = Post.all
    # loop iterate through posts, each 5th post is marked SPAM
    @posts.each_with_index do |post, index|
      if index % 5 == 0
        post.title = "SPAM"
      end
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
