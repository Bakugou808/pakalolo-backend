class TagSerializer < ActiveModel::Serializer
  attributes :id, :title, :collection_id, :collection
  belongs_to :collection
end
