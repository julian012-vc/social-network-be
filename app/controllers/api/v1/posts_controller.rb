module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show]

      # GET /posts
      def index
        posts = Post.where('post_id IS NULL').order('created_at DESC')
        result = posts.page(params[:page]).per(params[:per_page])
        total_pages = (posts.count/params[:per_page].to_f).ceil
        has_next = params[:page].to_i < total_pages

        render json: {
          result: PostSerializer.new(result),
          total_records: posts.count,
          total_pages: total_pages,
          page: params[:page].to_i,
          has_next: has_next
        }, status: :ok

      end

      # GET /posts/1
      def show
        render json: PostSerializer.new(@post, options)
      end

      # POST /posts
      def create
        @post = Post.new(post_params)

        if @post.save
          render json: PostSerializer.new(@post), status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      def options
        @options ||= { include: %i[comments] }
      end

      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:title, :content, :email, :post_id)
      end
    end
  end
end
