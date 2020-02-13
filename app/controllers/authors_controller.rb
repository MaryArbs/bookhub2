class AuthorsController < ApplicationController
    
    def index
        @authors = Author.all 
    end 

    def new 
        @author = Author.new
        @author.books.build #has_many
    end 
    
    def create
        @author = Author.new(author_params)
        if @author.save
          redirect_to authors_path
        else
          render :new
        end
      end
    
      private
    
      def author_params
        params.require(:author).permit(:name, books_attributes: [:title, :author_id])
      end
    end
end
