class PostsController < ApplicationController
  #methods to define controller actions
  def show
    @post = Post.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    # create new instance of Post, instance var @ post with empty post by Post.new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @topic = Topic.find(params[:topic_id])
    # assign topic to a post
    @post.topic = @topic
    # if Post is saved to database
    if @post.save
      # display message using flash[:notice]
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
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
      redirect_to [@post.topic, @post]
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
      redirect_to @post.topic
      # if failed message displays error and redirect user to  show view
    else
      flash.now[:alert] = "There was an error deleting the post."
      render :show
    end
  end

# ends the class PostsController
end
