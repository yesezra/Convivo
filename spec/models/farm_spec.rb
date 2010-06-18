require 'spec_helper'

describe Farm do
  before(:each) do
    @valid_attributes = {
      :name => "Farm Name",
      :organic => false,
      :latitude => -12.05,
      :longitude => -77.05,
      :altitude => 133
    }
  end

  it "should create a new instance given valid attributes" do
    Farm.create!(@valid_attributes)
  end
  
  it "should require a name" do
    no_name_farm = Farm.new(@valid_attributes.merge(:name => ""))
    no_name_farm.should_not be_valid
  end
  
  it "should require an organic token" do
    no_organic_farm = Farm.new(@valid_attributes.merge(:organic => ""))
    no_organic_farm.should_not be_valid
  end
  
  it "should require a longitude" do
    no_longitude_farm = Farm.new(@valid_attributes.merge(:longitude => ""))
    no_longitude_farm.should_not be_valid
  end
   
  it "should require a latitude" do
    no_latitude_farm = Farm.new(@valid_attributes.merge(:latitude => ""))
    no_latitude_farm.should_not be_valid
  end
  
  it "should require an altitude" do
    no_altitude_farm = Farm.new(@valid_attributes.merge(:altitude => ""))
    no_altitude_farm.should_not be_valid
  end
end
