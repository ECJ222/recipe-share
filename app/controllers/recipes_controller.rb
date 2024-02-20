class RecipesController < ApplicationController
    def index
        @recipes = Recipe.all
    end

    def show
        @recipe = Recipe.find(params[:id])
        render json: @recipe
    end

    def new
        @recipe = Recipe.new
    end

    def create
        recipe_params =  params.permit(:name, :description, :image)
        recipe_params[:user_id] = Current.user.id
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
          redirect_to recipes_path
        else
            puts "errors: #{@recipe.errors.full_messages}"
            render recipes_path
        end
    end

    def details
        @recipe = Recipe.find(params[:id])
    end

    def destroy
        @recipe = Recipe.find(params[:id])
        if @recipe.destroy
            redirect_to recipes_path
        else 
            render recipe_path
        end
    end

    def recipe_params
        params.require(:recipe).permit(:name, :description, :image_url)
    end
end
