require 'spec_helper'

describe "replies/edit" do
  before(:each) do
    @reply = assign(:reply, stub_model(Reply,
      :user => nil,
      :post => nil,
      :text => "MyString"
    ))
  end

  it "renders the edit reply form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", reply_path(@reply), "post" do
      assert_select "input#reply_user[name=?]", "reply[user]"
      assert_select "input#reply_post[name=?]", "reply[post]"
      assert_select "input#reply_text[name=?]", "reply[text]"
    end
  end
end
