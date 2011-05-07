class ComponentsController < ApplicationController
  
  before_filter :set_body_class

  protected

  def set_body_class
    @page_class = 'section-components'
  end
end
