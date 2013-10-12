require 'spec_helper'

describe "boxers/index" do
  before(:each) do
    assign(:boxers, [
      stub_model(Boxer,
        :first_name => "First Name",
        :last_name => "Last Name",
        :weight => 1.5,
        :fights_won => 1,
        :fights_lost => 2,
        :fights_drawn => 3,
        :gender => false,
        :active => false,
        :club_id => 4
      ),
      stub_model(Boxer,
        :first_name => "First Name",
        :last_name => "Last Name",
        :weight => 1.5,
        :fights_won => 1,
        :fights_lost => 2,
        :fights_drawn => 3,
        :gender => false,
        :active => false,
        :club_id => 4
      )
    ])
  end

  it "renders a list of boxers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
