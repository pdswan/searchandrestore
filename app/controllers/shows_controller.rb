class ShowsController < ApplicationController

  def index
    @uses_datepicker = true
    @shows           = Show.today
  end

end
