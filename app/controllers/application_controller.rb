class ApplicationController < ActionController::Base
  def hello
    render html: "Welcome to the Friend reminder app. Please go to http://localhost:3000/friends or http://localhost:3000/events"
  end

  def goodbye
    render html: "goodbye, world!"
  end
end
