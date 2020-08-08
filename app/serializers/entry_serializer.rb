class EntrySerializer < ActiveModel::Serializer
  attributes :id, :review, :rating, :vendor, :created_at
  
  # belongs_to :collection
  belongs_to :vendor
  # has_and_belongs_to_many :smoke_lists, optional: true 
end
