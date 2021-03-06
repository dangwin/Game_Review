class UsersController < ApplicationController
  before_action :require_login, only: [:show]


      def show
        @user = User.find(params[:id])
        @games = @user.games
        if @user == current_user
        else 
          flash[:notice] = "You do not have access to this page. Please log-in"
          redirect_to login_path
      end
    end 

    def new
        @user = User.new
      end
    
      def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to @user
        else
          render 'new'
        end
      end

      def omniauth 
        @user = User.create_from_omniauth(auth)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:message] = user.errors.full_messages.join(", ")
            redirect_to root_path
        end
    end

    def destroy
      session[:user_id] = nil
      @user = User.find(params[:id])
      @user.destroy
      redirect_to root_path
    end 

      private

      def auth
        request.env['omniauth.auth']
    end
    

      def current_user
        @current_user ||= User.find_by(id: session[:user_id])
      end
    
      def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :user_id)
      end
    end
    

