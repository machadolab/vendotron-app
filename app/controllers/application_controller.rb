class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  around_action :ic_handler

  layout :determine_layout


  def intercooler
    @intercooler_support ||= IntercoolerSupport.new(self)
  end

  def determine_layout
    if intercooler.request?
      'no_header'
    else
      'application'
    end
  end

  def ic_handler
    intercooler.before_request
    yield
    intercooler.after_request
  end

end
