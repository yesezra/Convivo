class CreateWashingStations < ActiveRecord::Migration
  def self.up
    create_table :washing_stations do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end

  def self.down
    drop_table :washing_stations
  end
end
