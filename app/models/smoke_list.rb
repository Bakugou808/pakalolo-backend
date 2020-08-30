class SmokeList < ApplicationRecord
  belongs_to :user
  # has_and_belongs_to_many :entries
  has_many :entries_smoke_lists
  has_many :entries, :through => :entries_smoke_lists
end
