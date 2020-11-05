class ReviewsController < ApplicationController
    before_action :require_login, only: [:index, :show, :create, :edit, :update, :destroy]
    before_action :find_game
    before_action :find_review, only: [:edit, :update, :destroy]

    def new
		@review = Review.new(game: @game)
	end

    def create
		@review = Review.new(review_params)
		@review.game_id = @game.id
		@review.reviewer_id = current_user.id

		if @review.save
			redirect_to game_path(@game)
		else
			render 'new'
		end
    end
    
    def edit
        flash[:alert] = "You are not allowed to edit this review"
        redirect_back(fallback_location: @game) unless @review.reviewer == current_user
    end

    def update
        flash[:alert] = "You are not allowed to edit this review"
        redirect_back(fallback_location: @game) unless @review.reviewer == current_user
        if @review.update(review_params)
            redirect_to game_path(@game)
        else
            render 'edit'
    end 
    end 

    def destroy
        if @review.reviewer == current_user
            @review.destroy
            redirect_to game_path(@game)
        else 
            flash[:alert] = "You are not allowed to delete this review"
            redirect_to game_path(@game)
    end 
end 


private

    def review_params
        params.require(:review).permit(:content, :comment)
    end

    def find_game
        @game = Game.find(params[:game_id])
    end

    def find_review
        @review = Review.find(params[:id])
    end


end
