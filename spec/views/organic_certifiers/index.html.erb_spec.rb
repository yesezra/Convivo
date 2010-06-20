require 'spec_helper'

describe "/organic_certifiers/index" do
  before(:each) do
    assigns[:organic_certifiers] = @organic_certifiers = [
      stub_model(OrganicCertifier,
        :new_record? => false,
        :id => 2,
        :name => "OC1",
        :code => "ABC123"
      ),
      stub_model(OrganicCertifier,
        :new_record? => false,
        :id => 3,
        :name => "OC2",
        :code => "124EDS"
      )      
    ]
    
    render
  end

  it "should list all organic certifiers" do
    @organic_certifiers.each do |oc|
      response.should have_tag('tr>td', /#{oc.name}/)
      response.should have_tag('tr>td', /#{oc.code}/)
    end
  end
end
