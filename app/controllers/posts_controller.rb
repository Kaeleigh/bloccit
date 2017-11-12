class PostsController < ApplicationController
  def index
    # declare instance var @posts and assign it collection of Post obj
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    # create new instance of Post, instance var @ post with empty post by Post.new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    # if Post is saved to database
    if @post.save
      # display message using flash[:notice]
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      # if Post isn't saved to database render a new view
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post was updated."
      redirect_to @post
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    # destroy method is called on @post
    if @post.destroy
      # if successful message is posted and user redirected to posts index view
      flash[:notice] = "\"#{@post.title}\" was deleted successfully."
      redirect_to posts_path
      # if failed message displays error and redirect user to  show view 
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

# ends the class PostsController
end
