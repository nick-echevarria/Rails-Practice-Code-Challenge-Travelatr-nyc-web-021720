class PostsController < ApplicationController

    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
        @destination = Destination.find(params[:id])
        @blogger = Blogger.find(params[:id])

        
    end

    def new
        @post = Post.new
        @destinations = Destination.all
        @bloggers = Blogger.all
    end

    def create
        @post = Post.create(post_params)        
        # if @post.valid?
            redirect_to post_path(@post)
        # else 
        #     flash[:errors] = @post.errors.full_messages
        #     redirect_to new_post_path
        # end

        # @post = Post.new(post_params)
        # if @post.save
        #     redirect_to post_path(@post)
        # else
        #     flash[:errors] = @post.errors.full_messages
        #     redirect_to edit_post_path
        # end
    end

    def update 
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path(@post)
        end
    end

    def edit
        @post = Post.find(params[:id])
    end
    
    private

    def post_params 
        params.require(:post).permit(:title, :content, :blogger_id, :destination_id)
    end

    # def destroy

    # end
end
