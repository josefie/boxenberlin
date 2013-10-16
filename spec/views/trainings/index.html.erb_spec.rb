require 'spec_helper'

describe "trainings/index" do
  before(:each) do
    assign(:trainings, [
      stub_model(Training,
        :weekday => 1,
        :description => "MyText",
        :club_id => 2
      ),
      stub_model(Training,
        :weekday => 1,
        :description => "MyText",
        :club_id => 2
      )
    ])
  end

  it "renders a list of trainings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
