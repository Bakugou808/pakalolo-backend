class Entry < ApplicationRecord
  belongs_to :collection
  belongs_to :vendor
  has_many :entries_smoke_lists, dependent: :destroy
  has_many :smoke_lists, :through => :entries_smoke_lists
  delegate :strain, :to => :collection, :allow_nil => true

end
