class User < ApplicationRecord
    has_one :collection
    has_many :comments
    has_many :likes 
    has_secure_password
    # add validation



end
