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
end
