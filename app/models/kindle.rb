class Kindle < ActiveRecord::Base
  validates_presence_of :status,
    message: 'Please fill the status'

  validates_presence_of :inventory_id,
    message: 'Please fill the Inventory Id'

  validates_uniqueness_of :inventory_id
end
