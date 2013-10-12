require 'spec_helper'

describe "clubs/edit" do
  before(:each) do
    @club = assign(:club, stub_model(Club,
      :name => "MyString",
      :street => "MyString",
      :street_no => 1,
      :zip => "MyString",
      :city => "MyString",
      :website => "MyString",
      :coaches => "MyText",
      :contact_name => "MyString",
      :contact_phone => "MyString",
      :contact_mail => "MyString"
    ))
  end

  it "renders the edit club form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", club_path(@club), "post" do
      assert_select "input#club_name[name=?]", "club[name]"
      assert_select "input#club_street[name=?]", "club[street]"
      assert_select "input#club_street_no[name=?]", "club[street_no]"
      assert_select "input#club_zip[name=?]", "club[zip]"
      assert_select "input#club_city[name=?]", "club[city]"
      assert_select "input#club_website[name=?]", "club[website]"
      assert_select "textarea#club_coaches[name=?]", "club[coaches]"
      assert_select "input#club_contact_name[name=?]", "club[contact_name]"
      assert_select "input#club_contact_phone[name=?]", "club[contact_phone]"
      assert_select "input#club_contact_mail[name=?]", "club[contact_mail]"
    end
  end
end
