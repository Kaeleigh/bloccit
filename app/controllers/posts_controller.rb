class PostsController < ApplicationController

  # before_action filter calls method before each action expect show
  before_action :require_sign_in, except: :show
  # filter method calls method except for show, new and create actions
  before_action :authorize_user_to_update, except: [:show, :new, :create, :destroy]
  before_action :authorize_user_to_delete, except: [:show, :new, :create, :edit, :update]
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

    @topic = Topic.find(params[:topic_id])
    # assign topic to a post
    @post = @topic.posts.build(post_params)
    # assign @post.user to scope new post
    @post.user = current_user
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
    @post.assign_attributes(post_params)

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

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

  def authorize_user_to_update
    post = Post.find(params[:id])
    unless current_user == post.user || current_user.admin? || current_user.moderator?
      flash[:alert] = "You must be an admin or moderator to do that."
      redirect_to [post.topic, post]
    end
  end

  def authorize_user_to_delete
    post = Post.find(params[:id])
    unless current_user == post.user || current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to [post.topic, post]
    end
  end
  # ends the class PostsController
end
