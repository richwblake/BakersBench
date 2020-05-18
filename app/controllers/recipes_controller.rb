class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]
    before_action :find_user
    before_action :logged_in?

    def index
        if params[:user_id]
            @recipes = @user.recipes
        else
            @recipes = Recipe.all
        end
    end
    
    def show
    end

    def new
        if @user == current_user
            @recipe = Recipe.new
        else
            alert_and_redirect_due_to_bad_permissions @user
        end
    end

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to user_recipe_path(@recipe.id), alert: "Recipe succesfully created, dig in!"
        else
            redirect_to new_user_recipe_path, alert: "Invalid recipe, please try again"
        end
    end

    def edit
        if @user == current_user
            @recipe
        else
            alert_and_redirect_due_to_bad_permissions @user
        end
    end

    def update
    end

    def destroy
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :total_prep_time, :description, :creator_id)
    end

    def find_recipe
        redirect_to user_recipes_path, alert: "Recipe could not be found" unless @recipe = Recipe.find_by(id: params[:id])
    end

    def find_user
        @user = User.find_by(id: params[:user_id])
    end
end