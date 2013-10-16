require 'spec_helper'

describe "trainings/edit" do
  before(:each) do
    @training = assign(:training, stub_model(Training,
      :weekday => 1,
      :description => "MyText",
      :club_id => 1
    ))
  end

  it "renders the edit training form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", training_path(@training), "post" do
      assert_select "input#training_weekday[name=?]", "training[weekday]"
      assert_select "textarea#training_description[name=?]", "training[description]"
      assert_select "input#training_club_id[name=?]", "training[club_id]"
    end
  end
end
