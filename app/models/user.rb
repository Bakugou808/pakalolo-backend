class User < ApplicationRecord
    has_one :collection
    has_many :comments
    has_many :likes 
end
