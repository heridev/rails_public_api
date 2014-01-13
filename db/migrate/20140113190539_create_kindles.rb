class CreateKindles < ActiveRecord::Migration
  def change
    create_table :kindles do |t|
      t.string :inventory_id
      t.text :status

      t.timestamps
    end
  end
end
