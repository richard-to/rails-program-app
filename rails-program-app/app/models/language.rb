class Language < ActiveRecord::Base
  after_initialize :defaults
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  has_many :programs

  private
  def defaults
    self.name ||= ''
  end

end
