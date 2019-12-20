class BloggersController < ApplicationController
    def show
        @blogger = Blogger.find_by(id: params[:id])
        @likes = 0
        @blogger.posts.each do |post|
            @likes += post.likes
        end
        @popular_post = most_popular_post
    end

    private

    def most_popular_post
        @blogger.posts.max_by { |blog| blog.likes }
    end
end