class AddFarmerIdToFarm < ActiveRecord::Migration
  def self.up
    add_column :farms, :farmer_id, :integer
    add_index :farms, :farmer_id
  end

  def self.down
    remove_column :farms, :farmer_id
  end
end
