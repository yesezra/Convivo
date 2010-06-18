require 'spec_helper'

describe OrganicCertifier do
  before(:each) do
    @valid_attributes = {
      :name => "Organic Certifier",
      :code => "cba123"
    }
  end

  it "should create a new instance given valid attributes" do
    OrganicCertifier.create!(@valid_attributes)
  end
  
  it "should require a code" do
    no_name_organic_certifier = OrganicCertifier.new(@valid_attributes.merge(:name => ""))
    no_name_organic_certifier.should_not be_valid
  end
  
  it "should require a code" do
    no_code_organic_certifier = OrganicCertifier.new(@valid_attributes.merge(:code => ""))
    no_code_organic_certifier.should_not be_valid
  end

  describe "farm associations" do

    before(:each) do
      @organic_certifier = OrganicCertifier.create(@valid_attributes)
    end

    it "should have a farm attribute" do
      @organic_certifier.should respond_to(:farms)
    end
  end

end
