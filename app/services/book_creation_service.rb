# app/services/book_creation_service.rb
class BookCreationService
  def initialize(params)
    @title = params[:title]
    @descr = params[:descr]
    @genre_id = params[:genre_id]
    @user_id = params[:user_id]
  end

  def call
    create_book
  end

  private

  attr_reader :title, :descr, :genre_id, :user_id

  def create_book
    book = Book.new(title: title, descr: descr, genre_id: genre_id, user_id: user_id)
    if book.save
      User.find(user_id).increment!(:books_count)
      book
    else
      nil
    end
  end
end
