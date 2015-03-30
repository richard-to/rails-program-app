class Program < ActiveRecord::Base
  validates :title, :subtitle, presence: true
  validates :code, length: { is: 6 }
end
