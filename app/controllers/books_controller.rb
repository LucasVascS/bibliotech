class BooksController < ApplicationController

    before_action :authenticate_user!

    def index
        
        @q = Book.ransack(params[:q])
        @books = @q.result(distinct: true).order(created_at: :desc)
        #@books = Book.order(created_at: :desc)

    end

    def show
        @book = Book.find(params[:id])

    end

    def edit
        @book = Book.find(params[:id])

    end

    def update
        @book = Book.find(params[:id])
        book_params = params.require(:book).permit(:name, :author, :synopsis, :category_id)
        if @book.update(book_params)
            redirect_to @book
        else
            render :edit
        end
    end

    def new
        @book = Book.new

    end

    def create
        book_params = params.require(:book).permit(:name, :author, :synopsis, :category_id)
        @book = Book.new(book_params)
        @book.created_by_id = current_user.id

        if @book.save
            redirect_to @book
        else
            render :new
        end
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_url

    end
end
