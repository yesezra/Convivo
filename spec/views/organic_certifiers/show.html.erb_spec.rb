require 'spec_helper'

describe "/organic_certifiers/show" do
  before(:each) do
    assigns[:organic_certifier] = @organic_certifier = stub_model(OrganicCertifier,
      :new_record? => false,
      :id => 2,
      :name => "OC1",
      :code => "ABC123"
    )
    
    render
  end


  it "should include the organic certifier name" do
    response.should have_tag("h2", /#{@organic_certifier.name}/)
  end
  
  it "should include the organic certifier code" do
    response.should have_tag("h3", /#{@organic_certifier.code}/)
  end
end
