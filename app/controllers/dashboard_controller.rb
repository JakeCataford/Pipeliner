class DashboardController < ApplicationController
  def index
    @models = Model.all  
  end
end
