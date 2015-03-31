class Language < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }
  has_many :programs
end
