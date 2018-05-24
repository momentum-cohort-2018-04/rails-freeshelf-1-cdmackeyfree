class User < ApplicationRecord
    has_many :books through: :checkouts
    validates :name, presence: true

    validates :username, presence: true
    validates_uniqueness_of :username

    has_secure_password
  
    def to_s
        username
    end
end
