require 'spec_helper'

describe "/farms/index" do
  before(:each) do
    assigns[:farms] = @farms = [
      stub_model(Farm,
        :new_record? => false,
        :name => "A Farmer",
        :organic => true,
        :latitude => -77.23,
        :longitude => -15.0,
        :altitude => 150,
        :organic_certifier_id => 2,
        :farmer_id => 3
      ),
      stub_model(Farm,
        :new_record? => false,
        :name => "Another Farmer",
        :organic => true,
        :latitude => -77.23,
        :longitude => -15.0,
        :altitude => 150,
        :organic_certifier_id => 3,
        :farmer_id => 2
      )
    ]
    
    assigns[:organic_certifiers] = @organic_certifiers = [
     stub_model(OrganicCertifier,
       :new_record? => false,
       :id => 2,
       :name => "OC2",
       :code => "ABC123"
     ),
     stub_model(OrganicCertifier,
       :new_record? => false,
       :id => 3,
       :name => "OC3",
       :code => "33333"
     )
    ]

    assigns[:farmers] = @farmers = [
     stub_model(Farmer,
       :new_record? => false,
       :id => 2,
       :name => "A Farmer"
     ),
     stub_model(Farmer,
       :new_record? => false,
       :id => 3,
       :name => "Another Farmer"
     )
    ]
  end


  it "should list all farmers" do
    render
    @farms.each do |farm|
      response.should have_tag('tr>td', /#{farm.name}/)
      response.should have_tag('tr>td', /#{farm.organic.to_s}/)
      response.should have_tag('tr>td', /#{farm.latitude.to_s}/)
      response.should have_tag('tr>td', /#{farm.longitude.to_s}/)
      response.should have_tag('tr>td', /#{farm.altitude.to_s}/)
    end
  end
end
