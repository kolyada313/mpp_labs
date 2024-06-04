# app/controllers/books_controller.rb
class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit]
  protect_from_forgery with: :null_session

  def index
    @books = Book.all
  end

  def new
    set_new_book
  end

  def search
    @genres = Genre.all
    @result = BookSearchQuery.new(params).call
  end

  def create
    service = BookCreationService.new(book_params)
    @book = service.call

    if @book
      current_user.increment!(:books_count)
      redirect_to @book
    else
      flash.now[:alert] = 'All fields must be filled!'
      set_new_book
      render :new
    end
  end

  def show
    @user = @book.user
    @genres = @book.genre
  end

  def edit
    @genres = @book.genre
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to @book, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    Book.delete_book_id(params[:id])
    redirect_to books_path
  end

  private

  def set_new_book
    @book = Book.new
    @genres = Genre.all
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :descr, :genre_id, :user_id)
  end
end
