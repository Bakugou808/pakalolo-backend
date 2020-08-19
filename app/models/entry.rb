class Entry < ApplicationRecord
  belongs_to :collection
  belongs_to :vendor
  has_and_belongs_to_many :smoke_list, optional: true, dependent: :destroy

  # def vendor 
  #   vendorId = self.vendor_id 

  #   vendors = Vendor.where(id: vendorId)
  #   byebug
  # end
end
