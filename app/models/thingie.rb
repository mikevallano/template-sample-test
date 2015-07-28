class Thingie < ActiveRecord::Base

  def momma
    self.name
  end

  def self.momma
    Thingie.find(2)
  end

end
