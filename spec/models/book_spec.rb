require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'is valid with valid attributes' do
    expect(Book.new(title: 'foo bar')).to be_valid
  end

  it 'is not valid without a title' do
    expect(Book.new(title: nil)).to_not be_valid
  end

  it 'has many authors' do
    should respond_to(:authors)
  end

  describe 'Books.with_authors() returns relation of books' do
    let!(:author) { create(:author) }
    let!(:author2) { create(:author) }
    let!(:book) { create(:book, authors: [author]) }
    let!(:book2) { create(:book, authors: [author, author2]) }

    it 'returns found books with one author' do
      books = Book.with_authors([author.name])
      expect(books).to include(book)
    end

    it 'returns found books with many authors' do
      books = Book.with_authors([author.name, author2.name])
      expect(books).to include(book, book2)
    end

    it 'returns empty array if books not found with given authors' do
      books = Book.with_authors(["#{author.name}a"])
      expect(books.count).to eq(0)
    end
  end
end
