# == Schema Information
# Schema version: 20100618185553
#
# Table name: farmers
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Farmer < ActiveRecord::Base
  attr_accessible :name
  
  validates_presence_of :name
  
  belongs_to :washing_station
end
