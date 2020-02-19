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
          @favorite = @book.favorites.build #new #has_many 
        else 
          @favorite = Favorite.new
          @favorite.build_book #belongs_to relationship
        end 
      end

    def create #adding to favorites 
      @favorite = Favorite.new(favorite_params)
      @favorite.user = current_user
        if @favorite.save 
          redirect_to book_favorite_path(@favorite.book, @favorite)
        else
          render :new
        end
    end
      
    def show
      @favorite = Favorite.find(params[:id])
    end

    def edit
      @favorite = Favorite.find(params[:id])
    end
  
    def update
      @favorite = Favorite.find(params[:id])
      @favorite.update(favorite_params)
      redirect_to favorite_path(@favorite)
    end
  
    def destroy   
      @favorite = Favorite.find(params[:id])
      @favorite.destroy
      redirect_to favorites_path
  end
  


    private
    def favorite_params
      params.require(:favorite).permit(:book_id, :review)
    end 


end
