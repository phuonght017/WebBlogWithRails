class CommentsController < ApplicationController
    def create
        if current_user
            @post = Post.find(params[:post_id])
            @comment = @post.comments.create(user_id: session[:user_id], content: comment_params[:content])
            redirect_to post_path(@post)
        else
            redirect_to :login, notice: "You need to log in to access more pages"
        end
    end
  
    def destroy
        if current_user
            @post = Post.find(params[:post_id])
            @comment = @post.comments.find(params[:id])
            @comment.destroy
            redirect_to post_path(@post)
        else
            redirect_to :login, notice: "You need to log in to access more pages"
          end
    end  

    private
    def comment_params
        params.required(:comment).permit(:content)
    end
end
