require 'spec_helper'

describe "trainings/new" do
  before(:each) do
    assign(:training, stub_model(Training,
      :weekday => 1,
      :description => "MyText",
      :club_id => 1
    ).as_new_record)
  end

  it "renders new training form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", trainings_path, "post" do
      assert_select "input#training_weekday[name=?]", "training[weekday]"
      assert_select "textarea#training_description[name=?]", "training[description]"
      assert_select "input#training_club_id[name=?]", "training[club_id]"
    end
  end
end
