class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def destroy
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def find_user
        redirect_to root_path, alert: "User could not be found" unless @user = User.find_by(id: params[:id])
    end
end