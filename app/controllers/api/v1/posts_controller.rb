module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]

      # GET /posts
      def index
        posts = Post.where('post_id IS NULL').order('created_at DESC')
        result = posts.page(params[:page]).per(params[:per_page])
        total_pages = (posts.count/params[:per_page].to_f).ceil
        has_next = params[:page].to_i < total_pages

        @options ||= {include: %i[comments]}

        render json: {
          result: PostSerializer.new(result, @options),
          total_records: posts.count,
          total_pages: total_pages,
          page: params[:page].to_i,
          has_next: has_next
        }, status: :ok

      end

      # GET /posts/1
      def show
        render json: @post
      end

      # POST /posts
      def create
        @post = Post.new(post_params)

        if @post.save
          render json: @post, status: :created, location: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /posts/1
      def update
        if @post.update(post_params)
          render json: @post
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # DELETE /posts/1
      def destroy
        @post.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def post_params
        params.require(:post).permit(:id, :title, :content, :email, :parent_id)
      end
    end
  end
end
