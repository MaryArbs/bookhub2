class FavoritesController < ApplicationController
    
    def index
        if params[:book_id] && @book = Book.find_by_id(params[:book_id])
            @favorites = @book.favorites #showing all the reviews for specific book 
        else 
            @favorites = Favorite.all # all books that have been favorited 
        end 
    end 
    
    def new #checking for nested route 
        if params[:book_id] && @book = Book.find_by_id(params[:book_id])
          @favorites = @book.favorites.build #new #has_many 
          binding.pry
    
        else 
          @favorite = Favorite.new
          @favorite.build_book #belongs_to relationship
        end 
      end

    def create #adding to favorites 
        @favorite = Favorite.new(favorite_params)
        
        if @favorite.save 
          redirect_to book_favorites_path(@favorite)
        else
          render :new
        end
    end
      
    def show
        @favorite = Favorite.find(params[:id])
    end


    private
    def favorite_params
      params.require(:favorite).permit(:user_id, :author_id, :review, books_attributes[:title])
    end 


end
