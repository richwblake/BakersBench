class RecipesController < ApplicationController
    def show
    end

    def new
    end

    def create
    end

    def destroy
    end

    private

    def recipe_params
        params.require(:recipe).permit(:title, :creator_id)
    end
end