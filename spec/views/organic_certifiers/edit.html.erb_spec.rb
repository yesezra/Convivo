require 'spec_helper'

describe "/organic_certifiers/edit" do
  before(:each) do
     assigns[:organic_certifier] = @organic_certifier = stub_model(OrganicCertifier,
       :new_record? => false,
       :id => 2,
       :name => "OC1",
       :code => "ABC123"
     )

     render
   end

   it "renders the organic certifier form" do
     response.should have_tag("form[action=#{organic_certifier_path(@organic_certifier)}][method=post]") do
       with_tag('input#organic_certifier_name[name=?]', "organic_certifier[name]")
       with_tag('input#organic_certifier_code[name=?]', "organic_certifier[code]")
     end
   end
end
