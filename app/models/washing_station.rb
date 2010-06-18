# == Schema Information
# Schema version: 20100618185553
#
# Table name: washing_stations
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  code       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class WashingStation < ActiveRecord::Base
  attr_accessible :name, :code
  
  validates_presence_of :name, :code
end
