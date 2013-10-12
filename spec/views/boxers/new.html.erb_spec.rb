require 'spec_helper'

describe "boxers/new" do
  before(:each) do
    assign(:boxer, stub_model(Boxer,
      :first_name => "MyString",
      :last_name => "MyString",
      :weight => 1.5,
      :fights_won => 1,
      :fights_lost => 1,
      :fights_drawn => 1,
      :gender => false,
      :active => false,
      :club_id => 1
    ).as_new_record)
  end

  it "renders new boxer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", boxers_path, "post" do
      assert_select "input#boxer_first_name[name=?]", "boxer[first_name]"
      assert_select "input#boxer_last_name[name=?]", "boxer[last_name]"
      assert_select "input#boxer_weight[name=?]", "boxer[weight]"
      assert_select "input#boxer_fights_won[name=?]", "boxer[fights_won]"
      assert_select "input#boxer_fights_lost[name=?]", "boxer[fights_lost]"
      assert_select "input#boxer_fights_drawn[name=?]", "boxer[fights_drawn]"
      assert_select "input#boxer_gender[name=?]", "boxer[gender]"
      assert_select "input#boxer_active[name=?]", "boxer[active]"
      assert_select "input#boxer_club_id[name=?]", "boxer[club_id]"
    end
  end
end
