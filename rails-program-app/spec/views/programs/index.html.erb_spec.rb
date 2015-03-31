require 'rails_helper'

RSpec.describe "programs/index", type: :view do
  before(:each) do
    language = Language.create(:name => 'Test Language')
    assign(:programs, [
      Program.create!(
        :title => "Title",
        :subtitle => "Subtitle",
        :code => "123456"
      ),
      Program.create!(
        :title => "Title",
        :subtitle => "Subtitle",
        :code => "123456",
        :language => language
      )
    ])
  end

  it "renders a list of programs" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Subtitle".to_s, :count => 2
    assert_select "tr>td", :text => "123456".to_s, :count => 2
    assert_select "tr>td", :text => "Test Language".to_s, :count => 1
  end
end
