require 'spec_helper'

describe "/farmers/show" do  
  describe "washing station association" do  
    before(:each) do
      assigns[:farmer] = @farmer = stub_model(Farmer,
        :new_record? => false,
        :name => "A Farmer"
      )
      @farmer.washing_station = stub_model(WashingStation,
        :new_record? => false,
        :id => 2,
        :name => "WS1",
        :code => "ABC123"
      )
    end

    it "should include the farmer's name" do
      render
      response.should have_tag("h2", /#{@farmer.name}/)    
    end
    
    it "should include the washing station" do
      render
      response.should have_tag("h3")
    end

  end
  
  describe "washing station association" do
    before(:each) do
      assigns[:farmer] = @farmer = stub_model(Farmer,
        :new_record? => false,
        :name => "A Farmer"
      )
    end
    
    it "should not include the washing station" do
      render
      response.should_not have_tag("h3")
    end
  end

end
