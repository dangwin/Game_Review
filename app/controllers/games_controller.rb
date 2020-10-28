class GamesController < ApplicationController
before_action :find_game, only: [:show, :edit, :destroy]


    def index 
        @games = Game.all
    end 

    def new
        @game = Game.new
    end

    def show
        @game = Game.find(params[:id]) 
    end 

    def create
        @game = Game.new(game_params)
        if @game.save
            redirect_to root_path
        else
            render 'new'
    end
end 

    def edit
        if @game.update(game_params)
            redirect_to game_path(@game)
        else
            render 'edit'
    end 
end 

    def update
    end

    def destroy
    end 


    private 

    def game_params
        params.permit(:title, :first_name, :last_name, :platform, :description, :genre)

    end

    def find_game
        @game = Game.find(params[:id]) 
    end 


end
