class UsersController < ApplicationController

    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?, only: [:index, :show, :edit, :destroy]

    def index
        @users = User.all
    end

    def show
    end

    def edit
        alert_and_redirect_due_to_bad_permissions @user unless @user == current_user
    end

    def update
        if @user.update(user_params)
            redirect_to user_path(@user), alert: "User updated successfully"
        else
            redirect_to edit_user_path(@user), alert: "Please try again"
        end
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user), notice: "User created successfully"
        else
            redirect_to new_user_path, alert: "Please try again"
        end
    end

    def destroy
        alert_and_redirect_due_to_bad_permissions @user unless @user == current_user
        session.delete :user_id
        @user.destroy
        redirect_to root_path
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def find_user
        redirect_to root_path, alert: "User could not be found" unless @user = User.find_by(id: params[:id])
    end
end