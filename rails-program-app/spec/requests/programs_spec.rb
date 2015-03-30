require 'rails_helper'


def expect_program_data_error_text(body)
  expect(body).to include(CGI::escapeHTML("Code is the wrong length (should be 6 characters)"))
  expect(body).to include(CGI::escapeHTML("Title can't be blank"))
  expect(body).to include(CGI::escapeHTML("Subtitle can't be blank"))
end


RSpec.describe "Programs management", type: :request do

  let(:valid_attributes) {
    { title: 'title', subtitle: 'subtitle', code: '123456' }
  }

  let(:invalid_attributes) {
    { title: '', subtitle: '', code: '123' }
  }

  let(:valid_updated_attributes) {
    { code: '654321' }
  }

  before(:each) do
    Program.create!(
      :id => 1,
      :title => "Title 1",
      :subtitle => "Subtitle 1",
      :code => "111111"
    )
    Program.create!(
      :id => 2,
      :title => "Title 2",
      :subtitle => "Subtitle 2",
      :code => "222222"
    )
  end

  describe "List programs" do
    it "lists all the created programs at the root url" do
      get root_url
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
      expect(response.body).to include(new_program_path)
    end
  end

  describe "Create programs" do
    it "creates a new program if data is valid" do
      get new_program_path
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
      post programs_path, :program => valid_attributes
      expect(response).to redirect_to(assigns(:program))
      follow_redirect!
      expect(response).to render_template(:show)
      expect(response.body).to include("Program was successfully created.")
    end

    it "displays errors if program is invalid" do
      get new_program_path
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
      post programs_path, :program => invalid_attributes
      expect(response).to render_template(:new)
      expect_program_data_error_text(response.body)
    end
  end

  describe "Edit programs" do
    it "update a new program if data is valid" do
      @program = Program.find(1)
      get edit_program_path(@program)
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(200)
      patch program_path(@program), :program => valid_updated_attributes
      expect(response).to redirect_to(assigns(:program))
      follow_redirect!
      expect(response).to render_template(:show)
      expect(response.body).to include("Program was successfully updated.")
      expect(response.body).to include("654321")
    end

    it "displays errors if updated program is invalid" do
      @program = Program.find(1)
      get edit_program_path(@program)
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(200)
      patch program_path(@program), :program => invalid_attributes
      expect(response).to render_template(:edit)
      expect_program_data_error_text(response.body)
    end
  end

  describe "Destroy programs" do
    it "destroys a program" do
      @program = Program.find(1)
      delete program_path(@program)
      follow_redirect!
      expect(response).to render_template(:index)
      expect(response.body).to include("Program was successfully destroyed.")
    end
  end

end

