class AboutPagesController < ApplicationController
  def index
    @about_page = AboutPage.last
  end
end
