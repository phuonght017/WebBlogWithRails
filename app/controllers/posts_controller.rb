class PostsController < ApplicationController
    def index
        @posts = Post.all.order("created_at DESC")
    end
  
    def new
        if current_user
            @post = Post.new
        else
            redirect_to :login, notice: "You need to log in to access more pages"
          end
    end
  
    def create
        if current_user
            @post = Post.new(user_id: session[:user_id], title: post_params[:title], content: post_params[:content], topic: post_params[:topic])
            if @post.save
                redirect_to posts_path
            else
                render 'new'
            end
        else
            redirect_to :login, notice: "You need to log in to access more pages"
          end
    end
  
    def show
        if current_user
            @post = Post.find(params[:id])
        else
            redirect_to :login, notice: "You need to log in to access more pages"
        end
    end
  
    def update
        if current_user
            @post = Post.find(params[:id])
    
            if @post.update(post_params)
                redirect_to @post
            else
                render 'edit'
            end
        else
            redirect_to :login, notice: "You need to log in to access more pages"
          end
    end
  
    def edit
        if current_user
            @post = Post.find(params[:id])
        else
            redirect_to :login, notice: "You need to log in to access more pages"
        end
    end
  
    def destroy
        if current_user
            @post = Post.find(params[:id])
            @post.destroy
            puts "DESTROYED"
            redirect_to posts_path 
        else
            redirect_to :login, notice: "You need to log in to access more pages"
          end 
    end
  
    private
  
    def post_params
        params.require(:post).permit(:title, :content, :topic)
    end  
end
