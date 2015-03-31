class Program < ActiveRecord::Base
  after_initialize :defaults
  validates :title, :subtitle, presence: true
  validates :code, length: { is: 6 }
  belongs_to :language

  private
  def defaults
    self.language ||= Language.new
  end

end
