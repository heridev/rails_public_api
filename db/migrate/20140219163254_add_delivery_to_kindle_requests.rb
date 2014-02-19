class AddDeliveryToKindleRequests < ActiveRecord::Migration
  def change
    add_column :kindle_requests, :delivery_date, :date
  end
end
