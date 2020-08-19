class Collection < ApplicationRecord
  belongs_to :strain
  belongs_to :user
  has_many :entries 
  has_many :tags

  def entries 
    collectionId = self.id 

    entries = Entry.where(collection_id: collectionId)
  end

end
