require 'spec_helper'

describe "posts/show" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :user => nil,
      :title => "Title",
      :location => "Location",
      :model => "Model",
      :chassis_number => "Chassis Number",
      :registration_number => "Registration Number",
      :features => "Features",
      :situation => "Situation"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Title/)
    rendered.should match(/Location/)
    rendered.should match(/Model/)
    rendered.should match(/Chassis Number/)
    rendered.should match(/Registration Number/)
    rendered.should match(/Features/)
    rendered.should match(/Situation/)
  end
end
