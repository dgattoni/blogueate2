class CommentsController < ApplicationController
  def create

	  @blog =Blog.find_by_slug(params[:blog_id])
 	
 	  @post =Post.find(params[:post_id])

	  @user = current_user.id

	  @comment = Comment.new(comment_params)

 	  @comment.post = @post

 	  @comment.user_id = @user

 	  @comment.save

      
	  redirect_to @blog


  end

  def update
  end

  def destroy
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :blog_id, :user_id)
    end



end
