class StrainSerializer < ActiveModel::Serializer
  attributes :id, :name, :genus, :flavorList, :description, :cannabinoidList, :terpeneList, :effects, :likes, :comments
  # has_many :likes, as: :likeable 
  # has_many :comments, as: :commentable
end
