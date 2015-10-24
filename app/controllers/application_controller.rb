class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout 'yeti'

  protect_from_forgery with: :exception

  before_action :site_http_basic_authenticate_with #if Rails.env.production?

  def site_http_basic_authenticate_with
    if Rails.env == 'production'
      authenticate_or_request_with_http_basic do |name, password|
        name == ENV['AUTH_USERNAME'] && password == ENV['AUTH_PASSWORD']
      end
    end
  end
end
