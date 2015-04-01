require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :user => nil,
      :title => "MyString",
      :location => "MyString",
      :model => "MyString",
      :chassis_number => "MyString",
      :registration_number => "MyString",
      :features => "MyString",
      :situation => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "input#post_user[name=?]", "post[user]"
      assert_select "input#post_title[name=?]", "post[title]"
      assert_select "input#post_location[name=?]", "post[location]"
      assert_select "input#post_model[name=?]", "post[model]"
      assert_select "input#post_chassis_number[name=?]", "post[chassis_number]"
      assert_select "input#post_registration_number[name=?]", "post[registration_number]"
      assert_select "input#post_features[name=?]", "post[features]"
      assert_select "input#post_situation[name=?]", "post[situation]"
    end
  end
end
