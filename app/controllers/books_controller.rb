class BooksController < ApplicationController

    def index
        @books = Book.all

    end

    def show
        @book = Book.find(params[:id])

    end

    def edit
        @book = Book.find(params[:id])

    end

    def update
        @book = Book.find(params[:id])
        book_params = params.require(:book).permit(:name, :author, :synopsis)
        @book.update(book_params)
        redirect_to @book
    end

    def new
        @book = Book.new

    end

    def create
        book_params = params.require(:book).permit(:name, :author, :synopsis, :category_id)
        @book = Book.new(book_params)
        @book.save
        redirect_to @book
    
    end
end
