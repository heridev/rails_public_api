class RemoveStatusFieldFromKindles < ActiveRecord::Migration
  def change
    remove_column :kindles, :status, :text
  end
end
