class TopicsController < ApplicationController
  # filter, redirect guests
  before_action :require_sign_in, except: [:index, :show]
  #filter checks role of signed in user, if not redirectd to index
  before_action :authorize_user_to_edit, except: [:index, :show, :new, :create, :destroy]
  before_action :authorize_user_to_create_or_delete, except: [:index, :show, :edit, :update]
  #methods to define controller actions
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to @topic, notice: "Topic was saved successfully."
    else
      flash.now[:alert] = "Error creating topic. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.assign_attributes(topic_params)

     if @topic.save
        flash[:notice] = "Topic was updated."
       redirect_to @topic
     else
       flash.now[:alert] = "Error saving topic. Please try again."
       render :edit
     end
  end

  def destroy
    @topic = Topic.find(params[:id])

     if @topic.destroy
       flash[:notice] = "\"#{@topic.name}\" was deleted successfully."
       redirect_to action: :index
     else
       flash.now[:alert] = "There was an error deleting the topic."
       render :show
     end
  end

  private
  def topic_params
    params.require(:topic).permit(:name, :description, :public)
  end

  # method defined
  def authorize_user_to_create_or_delete
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to topics_path
    end
  end

  def authorize_user_to_edit
    unless current_user.admin? || current_user.moderator?
      flash[:alert] = "You must be an admin or moderator to do that."
      redirect_to topics_path
    end
  end

  #ends the class
end
