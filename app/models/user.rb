class User < ApplicationRecord
    has_one :collection
    has_many :comments
    has_many :likes 
    has_many :smoke_lists
    has_secure_password
    # add validation


    def all_vendors
        
        entries = self.all_entries
        vendors = entries.map{|entry| entry.vendor}
        vendors.uniq!
        
    end
 
    def collections 
        userId = self.id 
        collection = Collection.where(user_id: userId)
        
    end

    def all_entries 
        entries = self.collections.map{|collection| collection.entries}
        entries.flatten!
        
    end

    def getTags 
        
        collections = self.collections 
        tags = collections.map{|collection| 
            collection.tags 
        }.flatten!
        titles = tags.map{|tag| tag.title }.uniq
        
        titles  
    end



end
