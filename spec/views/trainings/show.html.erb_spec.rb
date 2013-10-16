require 'spec_helper'

describe "trainings/show" do
  before(:each) do
    @training = assign(:training, stub_model(Training,
      :weekday => 1,
      :description => "MyText",
      :club_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
  end
end
