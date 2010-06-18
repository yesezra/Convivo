# == Schema Information
# Schema version: 20100618185553
#
# Table name: farms
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  organic    :boolean
#  latitude   :float
#  longitude  :float
#  altitude   :float
#  created_at :datetime
#  updated_at :datetime
#

class Farm < ActiveRecord::Base
  attr_accessible :name, :organic, :latitude, :longitude, :altitude
  
  validates_presence_of :name, :latitude, :longitude, :altitude
  validates_inclusion_of :organic, :in => [true, false]  
  
  belongs_to :organic_certifier
  belongs_to :farmer
end
