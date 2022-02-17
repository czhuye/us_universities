class HomeController < ApplicationController
  def index
    @universities = University.all.limit(10)
  end
end
