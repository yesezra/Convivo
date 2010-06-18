class AddWashingStationIdToFarmer < ActiveRecord::Migration
  def self.up
    add_column :farmers, :washing_station_id, :integer
    add_index :farmers, :washing_station_id
  end

  def self.down
    remove_column :farmers, :washing_station_id
  end
end
