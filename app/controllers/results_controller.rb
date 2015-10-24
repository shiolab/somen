class ResultsController < ApplicationController
  
  # GET /results
  # GET /results.json
  def index
    @mailform = Mailform.find(params[:mailform_id])
    @histories = @mailform.mailform_histories
  end

  # GET /results/1
  # GET /results/1.json
  def show
    @history = MailformHistory.find(params[:id])
    @mailform = @history.mailform
  end

end
