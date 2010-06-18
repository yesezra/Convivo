class CreateOrganicCertifiers < ActiveRecord::Migration
  def self.up
    create_table :organic_certifiers do |t|
      t.string :name
      t.string :code

      t.timestamps
    end
  end

  def self.down
    drop_table :organic_certifiers
  end
end
