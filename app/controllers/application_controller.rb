class ApplicationController < ActionController::Base
  def hello
    render html: "Hiya"
  end

  def goodbye
    render html: "goodbye, world!"
  end
end
