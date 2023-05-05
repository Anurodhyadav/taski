class PagesController < ApplicationController
  def contact
  end

  def home
    @allProject =  Project.all.limit(5)
  end

  def about
    @about_title = "About Anurodh"
  end
  def pagenotfound
    end
end
