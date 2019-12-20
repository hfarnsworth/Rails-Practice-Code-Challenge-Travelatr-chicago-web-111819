class PostsController < ApplicationController
    def show
        post_get!
    end

    def create
        @post = Post.new(parosts)
        @post.save
        redirect_to @post
    end

    def new
        @post = Post.new
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def edit
        post_get!
        @bloggers = Blogger.all
        @destinations = Destination.all
    end

    def update
        post_get!
        @post.update(parosts)
        redirect_to @post
    end

    def like
        post_get!
        @post.increment!(:likes)
        @post.save
        render :show
    end

    private

    def post_get!
        @post = Post.find_by(id: params[:id])
    end

    def parosts
        params.require(:post).permit(:blogger_id, :destination_id, :title, :content)
    end
end