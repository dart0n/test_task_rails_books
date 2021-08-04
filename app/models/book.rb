class Book < ApplicationRecord
  has_many :writings
  has_many :authors, through: :writings

  accepts_nested_attributes_for :authors

  validates :title, presence: true

  def self.with_authors(*authors)
    Book.joins(:authors).where('authors.name IN (?)', *authors).uniq
  end
end
