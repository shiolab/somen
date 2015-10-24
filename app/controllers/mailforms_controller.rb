class MailformsController < ApplicationController
  before_action :set_mailform, only: [:show, :edit, :update, :destroy, :sendmail]
  before_action :set_organization, only: [:index, :new, :show, :edit, :update]

  # GET /mailforms
  # GET /mailforms.json
  def index
    @mailforms = @organization.mailforms
  end

  # GET /mailforms/1
  # GET /mailforms/1.json
  def show
  end

  # GET /mailforms/new
  def new
    @mailform = @organization.mailforms.build
  end

  # GET /mailforms/1/edit
  def edit
  end

  # POST /mailforms
  # POST /mailforms.json
  def create
    @mailform = Mailform.new(mailform_params)
    @mailform[:organization_id] = params[:organization_id]

    respond_to do |format|
      if @mailform.save
        format.html { redirect_to @mailform, notice: 'Mailform was successfully created.' }
        format.json { render :show, status: :created, location: @mailform }
      else
        format.html { render :new }
        format.json { render json: @mailform.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mailforms/1
  # PATCH/PUT /mailforms/1.json
  def update
    respond_to do |format|
      if @mailform.update(mailform_params)
        format.html { redirect_to @mailform, notice: 'Mailform was successfully updated.' }
        format.json { render :show, status: :ok, location: @mailform }
      else
        format.html { render :edit }
        format.json { render json: @mailform.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mailforms/1
  # DELETE /mailforms/1.json
  def destroy
    organization_id = @mailform.organization_id
    @mailform.destroy
    respond_to do |format|
      format.html { redirect_to organization_mailforms_url(organization_id), notice: 'Mailform was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def sendmail
    from    = @mailform.sender
    subject = @mailform.subject
    msgbody = @mailform.body.gsub!("\r", "<br>")

    ActiveRecord::Base.transaction do
      hist_attributes = {sender: from, subject: subject, body: msgbody}
      @history = @mailform.mailform_histories.build(hist_attributes)
      @history.save!

      @mailform.to.each_line do |to|
        begin
          to  = to.chomp
          key = Message.create_key(to)
          url = url_for(controller: :pages, action: :notice, id: @history.id, key: key)
#          msg = ApplicationController.helpers.hbr(body).gsub!("[url]", %Q{<a href="#{url}">#{url}</a>})
          msg = msgbody.gsub("[url]", url)

          Message.targeted_mail(from, to, subject, msg).deliver_later

          @history.sent_logs.build(to: to, key: key).save!
        rescue
        end
      end
    end

    respond_to do |format|
#      format.html { redirect_to @mailform, notice: 'メールを送信しました' }
      format.html { redirect_to mailform_results_path(@mailform), notice: 'メールを送信しました' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailform
      @mailform = Mailform.find(params[:id])
    end

    def set_organization
      @organization = @mailform ? @mailform.organization : Organization.find(params[:organization_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mailform_params
      params.require(:mailform).permit(:organization_id, :sender, :subject, :body, :to, :is_hidden, :landing_page)
    end
end
