require 'spec_helper'

describe Farm do
  before(:each) do
    @organic_certifier = Factory(:organic_certifier)
    @farmer = Factory(:farmer)
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
  
  describe "organic certifier associations" do
    before(:each) do
      @farm = @organic_certifier.farms.create(@valid_attributes)
    end
    
    it "should have an organic certifier attribute" do
      @farm.should respond_to(:organic_certifier)
    end
    
    it "should have the right associated organic certifier" do
      @farm.organic_certifier.should == @organic_certifier
    end
  end
  
  describe "farmer associations" do
    before(:each) do
      @farm = @farmer.farms.create(@valid_attributes)
    end
    
    it "should have a farmer attribute" do
      @farm.should respond_to(:farmer)
    end
    
    it "should have the right associated farmer" do
      @farm.farmer.should == @farmer
    end
  end
  
end
