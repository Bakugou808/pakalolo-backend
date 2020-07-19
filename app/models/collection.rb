class Collection < ApplicationRecord
  belongs_to :strain
  belongs_to :user
  has_many :entries 
  has_many :tags
end
