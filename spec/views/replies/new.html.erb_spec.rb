require 'spec_helper'

describe "replies/new" do
  before(:each) do
    assign(:reply, stub_model(Reply,
      :user => nil,
      :post => nil,
      :text => "MyString"
    ).as_new_record)
  end

  it "renders new reply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", replies_path, "post" do
      assert_select "input#reply_user[name=?]", "reply[user]"
      assert_select "input#reply_post[name=?]", "reply[post]"
      assert_select "input#reply_text[name=?]", "reply[text]"
    end
  end
end
