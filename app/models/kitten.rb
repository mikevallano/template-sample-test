class Kitten < ActiveRecord::Base
  # has_many :events
  has_many :events, foreign_key: 'gatito_id'
end
