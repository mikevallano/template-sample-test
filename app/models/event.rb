class Event < ActiveRecord::Base

  # belongs_to :kitten
  belongs_to :gatito, class_name: 'Kitten'

  # def kitten_name
  #   Kitten.find_by_id(self.kitten_id).name
  # end


end
