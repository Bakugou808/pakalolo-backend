class VendorSerializer < ActiveModel::Serializer
  attributes :id, :name, :rating, :entries 
  has_many :entries
end
