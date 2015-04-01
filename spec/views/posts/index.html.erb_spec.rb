require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :user => nil,
        :title => "Title",
        :location => "Location",
        :model => "Model",
        :chassis_number => "Chassis Number",
        :registration_number => "Registration Number",
        :features => "Features",
        :situation => "Situation"
      ),
      stub_model(Post,
        :user => nil,
        :title => "Title",
        :location => "Location",
        :model => "Model",
        :chassis_number => "Chassis Number",
        :registration_number => "Registration Number",
        :features => "Features",
        :situation => "Situation"
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
    assert_select "tr>td", :text => "Model".to_s, :count => 2
    assert_select "tr>td", :text => "Chassis Number".to_s, :count => 2
    assert_select "tr>td", :text => "Registration Number".to_s, :count => 2
    assert_select "tr>td", :text => "Features".to_s, :count => 2
    assert_select "tr>td", :text => "Situation".to_s, :count => 2
  end
end
