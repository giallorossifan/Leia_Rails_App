class ApplicationController < ActionController::Base

  def hello
    render html: "hello Mondo"
  end

end
