require 'spec_helper'

describe Farmer do
  before(:each) do
    @valid_attributes = {
      :name => "Farmer Name"
    }
  end

  it "should create a new instance given valid attributes" do
    Farmer.create!(@valid_attributes)
  end
  
  it "should require a name" do
    no_name_farmer = Farmer.new(@valid_attributes.merge(:name => ""))
    no_name_farmer.should_not be_valid
  end
end
