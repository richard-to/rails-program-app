require 'rails_helper'

RSpec.describe "programs/show", type: :view do
  before(:each) do
    language = Language.create(:name => 'Test Language')
    @program = assign(:program, Program.create!(
      :title => "Title",
      :subtitle => "Subtitle",
      :code => "123456",
      :language => language
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Subtitle/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Test Language/)
  end
end
