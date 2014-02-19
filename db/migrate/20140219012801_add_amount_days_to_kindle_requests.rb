class AddAmountDaysToKindleRequests < ActiveRecord::Migration
  def change
    add_column :kindle_requests, :amount_day, :integer
  end
end
