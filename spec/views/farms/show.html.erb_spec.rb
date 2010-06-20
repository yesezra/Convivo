require 'spec_helper'

describe "/farms/show" do
  describe "display correct data" do 
    before(:each) do
      assigns[:farm] = @farm = stub_model(Farm,
        :new_record? => false,
        :name => "A Farmer",
        :organic => true,
        :latitude => -77.23,
        :longitude => -15.0,
        :altitude => 150
        )
        render
      end
      
      it "should include the farm's name" do
        response.should have_tag("h2", /#{@farm.name}/)    
      end
      
      it "should include the farm's organic status" do
        response.should have_tag("h3", /#{@farm.organic.to_s}/)    
      end
      
      it "should include the farm's latitude" do
        response.should have_tag("h3", /#{@farm.latitude.to_s}/)    
      end
    
      it "should include the farm's longitude" do
        response.should have_tag("h3", /#{@farm.longitude.to_s}/)    
      end
      
      it "should include the farm's altitude" do
        response.should have_tag("h3", /#{@farm.longitude.to_s}/)    
      end    
      
      it "should not include an organic certifier" do
        response.should_not have_tag("h3", /organic certifier/i)
      end
      it "should not include a farmer" do
        response.should_not have_tag("h3", /farmer/i)
      end
  end
  
  
  describe "with organic certifier and farmer" do  
    before(:each) do
      assigns[:farm] = @farm = stub_model(Farm,
        :new_record? => false,
        :name => "A Farm"
      )
      @farm.organic_certifier = stub_model(OrganicCertifier,
        :new_record? => false,
        :id => 2,
        :name => "OC1",
        :code => "ABC123"
      )
      @farm.farmer = stub_model(Farmer,
        :new_record? => false,
        :id => 2,
        :name => "Farmer A"
      )

      render
    end
    
    it "should include the organic certifier" do
      response.should have_tag("h3", /organic certifier/i)
      response.should have_tag("h3", /#{@farm.organic_certifier.name}/i)
    end

    it "should include the farmer" do
      response.should have_tag("h3", /farmer/i)
      response.should have_tag("h3", /#{@farm.farmer.name}/i)
    end

  end
end
