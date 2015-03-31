require 'rails_helper'

def assert_select_form_elements
  assert_select "input#program_title[name=?]", "program[title]"
  assert_select "input#program_subtitle[name=?]", "program[subtitle]"
  assert_select "input#program_code[name=?]", "program[code]"
  assert_select "select#program_language_id[name=?]", "program[language_id]"
end

RSpec.describe "programs/edit", type: :view do
  it "renders the edit program form" do

    @program = assign(:program, Program.create!(
      :title => "MyString",
      :subtitle => "MyString",
      :code => "123456"
    ))

    render

    assert_select "form[action=?][method=?]", program_path(@program), "post" do

      assert_select_form_elements
      expect(rendered).to match(/Select Language/)

    end
  end

  it "renders the edit program with language form" do
    @program = assign(:program, Program.create!(
      :title => "MyString",
      :subtitle => "MyString",
      :code => "123456",
      :language => Language.create(:name => 'Python')
    ))

    render

    assert_select "form[action=?][method=?]", program_path(@program), "post" do
      assert_select_form_elements
      expect(rendered).to match(/Python/)

    end
  end

end
