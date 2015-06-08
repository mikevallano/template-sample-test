class Loner < ActiveRecord::Base
  validates :name, presence: true
  # validates :taco, presence: true
end
