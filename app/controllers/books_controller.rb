class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :udpate, :destroy]
  
  def index
    @books = Book.search(params[:search])
  end 

  def new #checking for nested route 
      @book = Book.new
      @book.build_author #belongs_to relationship #nested form-creates new author
  end 

  def create 
    @book = Book.new(book_params)
    if @book.save
        redirect_to book_path(@book)
    else
        render :new # re-render the :new template WITHOUT throwing away the invalid @book
    end
  end

  def show
  end

  def edit
  end

  def update
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy   #'/book/:id'
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :author_id, :search, author_attributes: [:name])
  end 

  def set_book
    @book = Book.find(params[:id])
  end 
end
