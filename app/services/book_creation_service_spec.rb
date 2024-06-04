# spec/services/book_creation_service_spec.rb
require 'rails_helper'

RSpec.describe BookCreationService, type: :service do
  let(:user) { create(:user) }
  let(:genre) { create(:genre) }
  let(:valid_params) { { title: 'Test Title', descr: 'Test Description', genre_id: genre.id, user_id: user.id } }

  it 'creates a book with valid params' do
    service = BookCreationService.new(valid_params)
    book = service.call

    expect(book).to be_persisted
    expect(book.title).to eq('Test Title')
    expect(book.descr).to eq('Test Description')
    expect(book.genre_id).to eq(genre.id)
    expect(book.user_id).to eq(user.id)
  end

  it 'increments the user books_count' do
    expect {
      BookCreationService.new(valid_params).call
    }.to change { user.reload.books_count }.by(1)
  end

  it 'returns nil with invalid params' do
    invalid_params = valid_params.merge(title: '')
    service = BookCreationService.new(invalid_params)
    book = service.call

    expect(book).to be_nil
  end
end
