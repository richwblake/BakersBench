require 'securerandom'

class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to new_session_path, alert: "Invalid email or password, please try again"
        end
    end

    def omniauth
        @user = User.find_or_create_by(email: auth[:info][:email]) do |e|
            e.uid = auth['uid']
            e.name = auth['info']['name']
            e.password = SecureRandom.alphanumeric(20)
        end   
          session[:user_id] = @user.id
          redirect_to user_path(@user)
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end