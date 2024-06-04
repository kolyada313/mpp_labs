# app/queries/book_search_query.rb
class BookSearchQuery
  def initialize(params)
    @title = params[:title]
    @genre_id = params[:genre_id]
  end

  def call
    books = Book.all
    books = books.where('title ILIKE ?', "%#{@title}%") if @title.present?
    books = books.where(genre_id: @genre_id) if @genre_id.present?
    books
  end

  private

  attr_reader :title, :genre_id
end
