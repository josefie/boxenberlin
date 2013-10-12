require 'spec_helper'

describe "boxers/show" do
  before(:each) do
    @boxer = assign(:boxer, stub_model(Boxer,
      :first_name => "First Name",
      :last_name => "Last Name",
      :weight => 1.5,
      :fights_won => 1,
      :fights_lost => 2,
      :fights_drawn => 3,
      :gender => false,
      :active => false,
      :club_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/1.5/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/4/)
  end
end
