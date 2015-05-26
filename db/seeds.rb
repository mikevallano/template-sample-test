#Create demo user
user = User.create!(
    :name => ENV["STANDARD_NAME"],
    :email => ENV["STANDARD_EMAIL"],
    :password => ENV["STANDARD_PASSWORD"]
)
#Environment variables are in the config>application.yml file
