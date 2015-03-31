require 'rails_helper'

RSpec.describe "programs/show", type: :view do

  it "renders all attributes in <dd>" do
    language = Language.create(:name => 'Test Language')
    @program = assign(:program, Program.create!(
      :title => "Title",
      :subtitle => "Subtitle",
      :code => "123456",
      :language => language
    ))

    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Subtitle/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(/Test Language/)
  end

  it "renders required attributes" do
    @program = assign(:program, Program.create!(
      :title => "Title",
      :subtitle => "Subtitle",
      :code => "123456",
    ))

    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Subtitle/)
    expect(rendered).to match(/Code/)
    expect(rendered).not_to match(/Test Language/)
  end
end
