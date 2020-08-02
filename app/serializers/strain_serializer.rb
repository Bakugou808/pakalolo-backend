class StrainSerializer < ActiveModel::Serializer
  attributes :id, :name, :genus, :flavorList, :description, :cannabinoidList, :terpeneList, :effects
end
