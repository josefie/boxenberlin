require 'spec_helper'

describe "clubs/show" do
  before(:each) do
    @club = assign(:club, stub_model(Club,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Street/)
    rendered.should match(/1/)
    rendered.should match(/Zip/)
    rendered.should match(/City/)
    rendered.should match(/Website/)
    rendered.should match(/MyText/)
    rendered.should match(/Contact Name/)
    rendered.should match(/Contact Phone/)
    rendered.should match(/Contact Mail/)
  end
end
