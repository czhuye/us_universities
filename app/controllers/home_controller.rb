class HomeController < ApplicationController
  def index
    # @universities = University.include(:state).limit(10)
    @universities = University.all
  end
end
