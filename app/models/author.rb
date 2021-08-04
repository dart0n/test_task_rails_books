class Author < ApplicationRecord
  has_many :writings
  has_many :books, through: :writings

  accepts_nested_attributes_for :books

  validates :name, presence: true
end
