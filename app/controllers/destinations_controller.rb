class DestinationsController < ApplicationController
    def show
        @destination = Destination.find_by(id: params[:id])
        @recents = @destination.posts.order(created_at: :desc).take(5)
        @most_liked = @destination.posts.max_by { |post| post.likes }
    end
end