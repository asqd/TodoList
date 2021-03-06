require 'spec_helper'

describe "todolists/index" do
  before(:each) do
    assign(:todolists, [
      stub_model(Todolist,
        :title => "Title",
        :description => "MyText"
      ),
      stub_model(Todolist,
        :title => "Title",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of todolists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h2", :text => "Title".to_s, :count => 2
    assert_select "p", :text => "MyText".to_s, :count => 2
  end
end
