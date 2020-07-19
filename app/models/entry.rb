class Entry < ApplicationRecord
  belongs_to :collection
  belongs_to :vendor
  has_and_belongs_to_many :smoke_list, optional: true 
end
