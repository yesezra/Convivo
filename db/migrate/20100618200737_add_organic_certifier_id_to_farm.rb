class AddOrganicCertifierIdToFarm < ActiveRecord::Migration
  def self.up
    add_column :farms, :organic_certifier_id, :integer
    add_index :farms, :organic_certifier_id
  end

  def self.down
    remove_column :farms, :organic_certifier_id
  end
end
