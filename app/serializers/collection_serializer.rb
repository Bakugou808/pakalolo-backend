class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :strain, :rating, :entries, :tags, :updated_at
  belongs_to :strain
  has_many :entries 
  has_many :tags
end
