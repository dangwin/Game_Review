class GamesController < ApplicationController
before_action :find_game, only: [:show, :edit, :update, :destroy]
before_action :require_login, only: [:index, :show, :create, :edit, :update, :destroy]
before_action :current_user

    def index 
        @games = Game.all
    end 

    def new
        @game = Game.new
    end

    def show
        @game = Game.find(params[:id]) 
        user = current_user
    end 

    def create
        #  @game = Game.new(game_params)
        #  @game.user_id = current_user.id
        #  @game.creator_id = current_user.id
        @game = current_user.games.build(game_params)
        if @game.save
            redirect_to current_user
        else
            render 'new'
    end
end 

    def edit
        
end 

    def update
        if @game.update(game_params)
            redirect_to game_path(@game)
        else
            render 'edit'
    end 
    end

    def destroy
        @game.destroy
        redirect_to current_user
    end 


    private 

    def game_params
        params.require(:game).permit(:title, :first_name, :last_name, :platform, :description, :genre, :user_id)

    end

    def find_game
        @game = Game.find(params[:id]) 
    end 

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
      end


end
