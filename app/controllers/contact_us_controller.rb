class ContactUsController < ApplicationController
  
  def new
    @contact_u = ContactU.new 
  end

 
  def create
    @contact_u = ContactU.new(params[:contact_u])
    debugger
    respond_to do |format|
      if @contact_u.save
        format.html { redirect_to(contact_us_path, :notice => 'Thanks for droping a line.We will be contacting you soon.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

 
end
