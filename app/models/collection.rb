class Collection < ApplicationRecord
  belongs_to :strain
  belongs_to :user
  has_many :entries 
  has_many :tags

  def entries 
    collectionId = self.id 

    entries = Entry.where(collection_id: collectionId)
  end

  def self.getTagMatches(title, user)
    collections = Collection.where(user_id: user.id) 

    tags = Tag.where(title: title)
    
    matchedCollectionIds = tags.map{|tag| 
      collections.select{|collection|
        tag.collection_id == collection.id}}.map{|collectionObj| collectionObj[0].id}
    
    matchedCollectionIds 

end 

end
