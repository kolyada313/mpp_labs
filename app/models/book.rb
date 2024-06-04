class Book < ApplicationRecord
  belongs_to :deal, optional: true
  belongs_to :genre
  belongs_to :user
  has_one_attached :cover_image

  validates :title, presence: true
  validates :descr, presence: true
  validates :user, presence: true

  def self.add_book(title, descr, genre_id, user_id)
    user = User.find(user_id)
    genre = Genre.find(genre_id)
    book = Book.new(title:, descr:, genre:, user:)
    if book.valid?
      book.save
      Book.last
    else
      puts book.errors.full_messages
      nil
    end
  end

  def self.update_book(id, title, descr, genre_id, user_id)
    book = Book.find(id)
    genre = Genre.find(genre_id)
    user = User.find(user_id)
    new_book = Book.new(title:, descr:, genre:, user:)
    if new_book.valid?
      book.update(title:, descr:, genre:, user:)
      Book.find(id)
    else
      puts new_book.errors.full_messages
      nil
    end
  end

  def self.delete_book_id (id)
    book = Book.find(id)
    if book
      user = book.user
      book.destroy
      user.decrement!(:books_count) if user.present?
    else
      false
    end
    book.authors = []
    book.delete
    end

  def self.add_book_genre(book_id, genre_id)
    book = Book.find(book_id)
    genre = Genre.find(genre_id)
    book.genre << genre
  end

  def self.ransackable_attributes(auth_object = nil)
    ["deal_id", "descr", "genre_id", "id", "id_value", "title", "user_id"]
  end

end