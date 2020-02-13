class FavoritesController < ApplicationController
    def index
        if params[:book_id] && @book = Book.find_by_id(params[:bok_id])
            @favorites = @book.favorites
        else 
            @favorites = Favorite.all
        
        end 
    end 


    private
    def favorite_params
      params.require(:favorite).permit(:user_id, :author_id, :review)
    end 


end
