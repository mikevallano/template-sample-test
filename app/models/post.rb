class Post < ActiveRecord::Base
  def as_json(options={})
    { :name => self.name }  # NOT including the body field
  end


end
