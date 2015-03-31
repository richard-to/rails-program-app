class Program < ActiveRecord::Base
  validates :title, :subtitle, presence: true
  validates :code, length: { is: 6 }
  belongs_to :language
end
