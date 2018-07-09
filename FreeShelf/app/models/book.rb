class Book < ApplicationRecord
    has_many :book_authors
    has_many :authors, through: :book_authors
    has_many :users, through: :checkouts
    validates :title, presence: true
    validates :description, presence: true
    validates :language, presence: true
end
