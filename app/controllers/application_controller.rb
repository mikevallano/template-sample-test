class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  def date_from_string(string)
    return DateTime.strptime(string, '%m/%d/%Y %I:%M %p')
  end

  def string_from_date(date)
    return DateTime.strftime(string, '%m/%d/%Y %I:%M %p')
  end
end


# DateTime.strptime("06/22/2015 08:00 PM", '%m/%d/%Y %I:%M %p')