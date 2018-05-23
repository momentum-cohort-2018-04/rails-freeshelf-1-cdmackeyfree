class User < ApplicationRecord
    has_many :books through: :checkouts
    validates :name, presence: true
end
