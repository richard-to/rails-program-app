require 'rails_helper'

def expect_required_data(rendered)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Subtitle/)
    expect(rendered).to match(/Code/)
end

RSpec.describe "programs/show", type: :view do

  it "renders all attributes in <dd>" do
    @program = assign(:program, Program.create!(
      :title => "Title",
      :subtitle => "Subtitle",
      :code => "123456",
      :language => Language.create(:name => 'Test Language')
    ))

    render
    expect_required_data(rendered)
    expect(rendered).to match(/Test Language/)
  end

  it "renders required attributes" do
    @program = assign(:program, Program.create!(
      :title => "Title",
      :subtitle => "Subtitle",
      :code => "123456",
    ))

    render
    expect_required_data(rendered)
    expect(rendered).not_to match(/Test Language/)
  end
end
