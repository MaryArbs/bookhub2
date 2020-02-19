class BooksController < ApplicationController
  
  def index
      @books = Book.all.order_alphabetically
  end

  def new #checking for nested route 
      @book = Book.new
      @book.build_author #belongs_to relationship
  end 

  def create 
    @book = Book.new(book_params)
    if @book.save
        redirect_to book_path(@book)
    else
        render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy   #'/book/:id'
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author_id, author_attributes: [:name])
  end 
end
