class CommentsController < ApplicationController
    def index
        @recipes = Recipe.find(params[:recipe_id])
        @comments = @recipe.comments.all
    end

    def create
        comment_params = params.permit(:content, :recipe_id)
        comment_params[:user_id] = Current.user.id
        @recipe = Recipe.find(comment_params[:recipe_id])
        @comment = @recipe.comments.new(comment_params)
        if @comment.save
            redirect_to "/recipes/details/#{@recipe.id}"
        else
            render 'recipes/details'
        end
    end

    def update
        @recipe = Recipe.find(params[:recipe_id])
        @comment = @recipe.comments.find(params[:id])
        if @comment.update(comment_params)
            render json: @recipe
        else
            render json: @recipe.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @recipe = Recipe.find(params[:recipe_id])
        @comment = @recipe.comments.find(params[:id])
        @comment.destroy
        if @comment.destroy
            redirect_to recipe_path
        else 
            render recipe_path
        end
    end
end
