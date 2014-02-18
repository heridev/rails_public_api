class CreateKindleRequests < ActiveRecord::Migration
  def change
    create_table :kindle_requests do |t|
      t.integer :user_id
      t.integer :kindle_id
      t.string :status

      t.timestamps
    end
  end
end
