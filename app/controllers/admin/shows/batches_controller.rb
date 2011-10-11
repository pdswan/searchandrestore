class Admin::Shows::BatchesController < ApplicationController

  def new
    redirect_to new_admin_show_path(:start_batch => true)
  end

end
