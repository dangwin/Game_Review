class SessionsController < ApplicationController
   

  
    def new
    end

    def create
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else 
            flash[:notice] = "Your e-mail or password is incorrect, please try again."
            redirect_to login_path
        end     
       
      end
    
      def destroy
        session.clear
        redirect_to root_path
      end
    
    end