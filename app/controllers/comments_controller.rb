class CommentsController < ApplicationController
  # #call method to ensure guests aren't allowed to create comment
   before_action :require_sign_in

   before_action :authorize_user, only: [:destroy]

   def create
 # #find and create new comment
     @post = Post.find(params[:post_id])
     comment = @post.comments.new(comment_params)
     comment.user = current_user

     if comment.save
       flash[:notice] = "Comment saved successfully."
 # #redirect show view if comment is valid or not
       redirect_to [@post.topic, @post]
     else
       flash[:alert] = "Comment failed to save."
 # #redirect show view
       redirect_to [@post.topic, @post]
     end
   end

   def destroy
     @post = Post.find(params[:post_id])
     comment = @post.comments.find(params[:id])

     if comment.destroy
       flash[:notice] = "Comment was deleted."
       redirect_to [@post.topic, @post]
     else
       flash[:alert] = "Comment could not be deleted. Try again."
       redirect_to [@post.topic, @post]
     end
   end

   private

 # # defined method to whitelist parameters
   def comment_params
     params.require(:comment).permit(:body)
   end
  # defined method allowing comment owner or admin to delete comment
  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = "You do not have permission to delete a comment!"
      redirect_to [comment.post.topic, comment.post]
    end
  end
# closes class
end
