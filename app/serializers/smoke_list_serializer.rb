class SmokeListSerializer < ActiveModel::Serializer
  attributes :id, :entry
  has_and_belongs_to_many :entries

end
