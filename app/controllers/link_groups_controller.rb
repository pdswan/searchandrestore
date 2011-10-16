class LinkGroupsController < ApplicationController

  def index
    @link_groups = LinkGroup.includes(:links).all
  end

end
