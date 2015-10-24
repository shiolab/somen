class PagesController < ApplicationController
  skip_before_action :site_http_basic_authenticate_with

  def notice
    @history = MailformHistory.find(params[:id])
    @history.access_logs.build(key: params[:key]).save!

    redirect_to @history.mailform.landing_page and return if @history.mailform.landing_page.present?
  end
end
