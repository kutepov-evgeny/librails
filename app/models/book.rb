class Book < ApplicationRecord
  belongs_to :subject

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  validates :price, presence: true, :inclusion => 1..1000
end
