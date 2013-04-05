class MessagesController < ApplicationController

	before_filter :authenticate_user
  before_filter :check_authorization

  def index
    @messages = @user.messages.where('draft = ?','0').paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end

  def search
    @messages = Message.where('draft = ?','0').search(params[:search])
    render :action => 'index'
  end

  def show
    @message = Message.find(params[:id])
    begin
      response = HTTParty.get('https://sendgrid.com/api/stats.get.json?api_user=mohitjain&api_key=mohitjain&category='+@message.category)
      data = JSON.parse(response)
      if data.first.class != Array
        @message.mail_statistics(data)
      end  
    rescue
    end
  end

  def new
    @message = @user.messages.build
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    @message = @user.messages.new(params[:message])

    if @user.contacts.count != 0
      if params[:commit] == 'Send Now'
        @message.send_mail(@user)
        redirect_to user_messages_path(@user), notice: 'Message was successfully sent.'
      elsif params[:commit] == 'Save Draft'
        @message.draft = true
        @message.save
        redirect_to draft_user_path(@user), notice: 'Message was successfully saved.'
      else
        render action: "new"      
      end
    else
      redirect_to user_contacts_path(@user), notice: 'There are no Contacts in your Contact list.' 
    end  
  end

  def update
    @message = Message.find(params[:id])
    @message.update_attributes(params[:message])
    if params[:commit] == 'Send Now'
      @message.draft = false
      @message.send_mail(@user)
      redirect_to  user_messages_path(@user), notice: 'Message was successfully sent.'
    elsif params[:commit] == 'Save Draft'
      @message.draft = true
      @message.save
      redirect_to draft_user_path(@user), notice: 'Message was successfully saved.'
    else
      render action: "edit"      
    end
  end

  private
   def authenticate_user
   	@user = User.find_by_id(params[:user_id])
   	redirect_to root_path if @user.nil?
   end

   def check_authorization
    redirect_to root_path , alert: 'Not authorized to view this page.'if @user != current_user
  end
end