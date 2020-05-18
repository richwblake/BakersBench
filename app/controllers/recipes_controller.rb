class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]
    before_action :logged_in?

    def index
        @recipes = Recipe.all
    end
    
    def show
    end

    def new
        @recipe = Recipe.new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :creator_id)
    end

    def find_recipe
        redirect_to recipes_path, alert: "Recipe could not be found" unless @recipe = Recipe.find_by(id: params[:id])
    end
end