class ContactsController < ApplicationController

	before_filter :authenticate_user
  before_filter :check_authorization

  def index
    @contacts = @user.contacts.paginate(:page => params[:page], :per_page => 10).order('id DESC')
  end

  def new
    @contacts = []
    1.times {@contacts << @user.contacts.build}
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
      if @user.update_attributes(params[:user])
        redirect_to user_contacts_path(@user), notice: 'Contact was successfully created.' 
      else
        @contacts = []
        1.times {@contacts << @user.contacts.build}
       render action: "new" 
      end
  end

  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        format.html { redirect_to user_contacts_path(@user), notice: 'Contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to user_contacts_path(@user), notice: 'Contact was successfully deleted.'
  end

  private
   def authenticate_user
   	@user = User.find_by_id(params[:user_id])
   	redirect_to root_path if @user.nil?
   end

   def check_authorization
    redirect_to root_path if @user != current_user
  end
end