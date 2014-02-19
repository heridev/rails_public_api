class Kindle < ActiveRecord::Base

  has_many :kindle_requests

  scope :available, -> { includes(:kindle_requests)
                         .where('kindle_requests.status != ? or kindle_id is null', 'active')
                         .references(:kindle_requests) }

  validates_presence_of :status,
    message: 'Please fill the status'

  validates_presence_of :inventory_id,
    message: 'Please fill the Inventory Id'

  validates_uniqueness_of :inventory_id
end
