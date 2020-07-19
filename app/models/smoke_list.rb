class SmokeList < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :entries
end
