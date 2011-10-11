class Admin::Shows::BatchesController < ApplicationController

  def new
    redirect_to new_admin_show_path(:start_batch => true)
  end

  def destroy
    session[:batch].delete(:show)
    redirect_to :back, :notice => 'You have exited batch mode.'
  end

end
