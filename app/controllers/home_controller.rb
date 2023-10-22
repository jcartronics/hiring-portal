class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:jobs]
  def index
  end

  def jobs
  end
end
