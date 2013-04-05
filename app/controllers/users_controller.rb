class UsersController < ApplicationController

  before_filter :authenticate_user, :only => [:draft]

  def welcome
    redirect_to user_messages_path(current_user) if user_signed_in?
  end

  def home
  end

  def draft
    @messages = @user.messages.where('draft = ?','1').paginate(:page => params[:page], :per_page => 10).order('updated_at DESC')
  end

  private
   def authenticate_user
    @user = User.find_by_id(params[:id])
    redirect_to root_path if @user.nil?
   end

end
