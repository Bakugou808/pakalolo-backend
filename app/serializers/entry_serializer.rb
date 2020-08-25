class EntrySerializer < ActiveModel::Serializer
  attributes :id, :review, :rating, :vendor, :created_at, :vendor_id, :smoke_list_id, :collection, :updated_at, :strain
  
  belongs_to :collection
  belongs_to :vendor
  # delegate :strain, :to => :collection, :allow_nil => true

  # has_and_belongs_to_many :smoke_lists, optional: true 
end
