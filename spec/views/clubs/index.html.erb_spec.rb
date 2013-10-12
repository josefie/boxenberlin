require 'spec_helper'

describe "clubs/index" do
  before(:each) do
    assign(:clubs, [
      stub_model(Club,
        :name => "Name",
        :street => "Street",
        :street_no => 1,
        :zip => "Zip",
        :city => "City",
        :website => "Website",
        :coaches => "MyText",
        :contact_name => "Contact Name",
        :contact_phone => "Contact Phone",
        :contact_mail => "Contact Mail"
      ),
      stub_model(Club,
        :name => "Name",
        :street => "Street",
        :street_no => 1,
        :zip => "Zip",
        :city => "City",
        :website => "Website",
        :coaches => "MyText",
        :contact_name => "Contact Name",
        :contact_phone => "Contact Phone",
        :contact_mail => "Contact Mail"
      )
    ])
  end

  it "renders a list of clubs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Street".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Name".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Mail".to_s, :count => 2
  end
end
