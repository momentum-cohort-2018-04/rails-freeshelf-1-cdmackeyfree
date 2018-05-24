class User < ApplicationRecord
    has_many :checkouts
    has_many :books_in_bag, through: :checkouts, class_name: 'Book'
    has_many :books_available, class_name: 'Book'

    validates :username, presence: true
    validates_uniqueness_of :username

    has_secure_password
  
    def to_s
        username
    end
end
