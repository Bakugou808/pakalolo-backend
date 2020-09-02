class SmokeListSerializer < ActiveModel::Serializer
  attributes :id, :entries, :title, :description, :updated_at
  has_many :entries_smoke_lists
  has_many :entries, :through => :entries_smoke_lists

end
