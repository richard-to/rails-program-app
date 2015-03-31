require 'rails_helper'

RSpec.describe Language, type: :model do
  let(:valid_attributes) {
    { name: 'language 1' }
  }

  let(:invalid_attributes) {
    { name: '' }
  }

  it "can create a language instance" do
    language = Language.new
  end

  it "defaults to an empty string" do
    language = Language.new
    expect(language.name).to eq ''
  end

  it "can create a valid language" do
    language = Language.new(valid_attributes)
    expect(language.valid?).to be_truthy
  end

  it "cannot create a language that already exists" do
    Language.create!(valid_attributes)
    language = Language.new(valid_attributes)
    expect(language.valid?).to be_falsey
  end

  it "cannot create a language with no name" do
    language = Language.new(invalid_attributes)
    expect(language.valid?).to be_falsey
  end
end
