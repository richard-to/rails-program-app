require 'rails_helper'

RSpec.describe Program, type: :model do

  let(:valid_attributes) {
    { title: 'title', subtitle: 'subtitle', code: '123456' }
  }

  let(:invalid_code) {
    123
  }

  it "can create a program instance" do
    program = Program.new
  end

  it "can create an valid program" do
    program = Program.new(valid_attributes)
    expect(program.valid?).to be_truthy
  end

    it "creates an empty language by default" do
      program = Program.new(valid_attributes)
      expect(program.language.name).to eq ''
    end

  context "cannot create a valid program" do
    it "requires a 6-character code" do
      program = Program.new(valid_attributes)
      program.code = invalid_code
      expect(program.valid?).to be_falsey
    end

    it "requires a title" do
      program = Program.new(valid_attributes)
      program.title = ''
      expect(program.valid?).to be_falsey
    end

    it "requires a subtitle" do
      program = Program.new(valid_attributes)
      program.subtitle = ''
      expect(program.valid?).to be_falsey
    end

  end

end
