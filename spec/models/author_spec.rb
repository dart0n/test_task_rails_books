require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'is valid with valid attributes' do
    expect(Author.new(name: 'foo bar')).to be_valid
  end

  it 'is not valid without a name' do
    expect(Author.new(name: nil)).to_not be_valid
  end

  it 'has many books' do
    should respond_to(:books)
  end
end
