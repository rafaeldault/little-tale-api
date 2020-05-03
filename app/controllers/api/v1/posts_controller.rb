class Api::V1::PostsController < ApplicationController
    before_action :set_post, only: [:show, :update, :destroy]


    def index
        posts = Post.all
        render json: posts, status: 200
    end

    def show
        post = Post.find(params[:id])

        render json: post, status: 200
    end

    def create
        
        post = Post.new(post_params)

        if post.save
            render json: post, status: 201
        else
            render json: post.errors, status: 422
        end
    end

    def update
        post = Post.find(params[:id])
        if post.update(post_params)
            render json: post, status: :ok
        else
            render json: post.errors, status: 422
        end
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
    end


    private

    def set_post
        post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:text, :title, :id, :user_id)
    end
    



end
