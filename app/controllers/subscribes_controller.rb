class SubscribesController < ApplicationController
	
  def show
    @subscribe = Subscribe.find(params[:id])
  end


  def edit
    @subscribe = Subscribe.find(params[:id])
  end

  def update
    @subscribe = Subscribe.find(params[:id])

    respond_to do |format|
      if @subscribe.update_attributes(params[:subscribe])
        format.html { redirect_to @subscribe, notice: 'Subscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @subscribe.errors, status: :unprocessable_entity }
      end
    end
  end

end
