class PagesController < ApplicationController
  allow_unauthenticated_access only: %i[ register about ]
  def register
  end

  def home
    # controller action for the home page
    @name = "Mekanika"
  end

  def about
  end
end
