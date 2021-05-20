module Api
  module V1
    class ReactionsController < ApplicationController
      before_action :set_reaction, only: [:destroy]

      def create
        @reaction = Reaction.new(reaction_params)

        if @reaction.save
          render json: ReactionSerializer.new(@reaction), status: :created
        else
          render json: @reaction.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @reaction.destroy
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_reaction
        @reaction = Reaction.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def reaction_params
        params.require(:reaction).permit(:post_id, :type_reaction)
      end
    end
  end
end
