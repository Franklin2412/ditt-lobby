class HomeController < ApplicationController
  before_action :unauthenticated_fellow_only!, only: :index

  def index
    @fellow = Fellow.new
  end

end
