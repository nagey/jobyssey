class JobysseyController < ApplicationController

  layout 'index'

  def about
  end

  def contact
  end

  def copyright
  end

  def index
    @professional = Professional.new
  end

end
