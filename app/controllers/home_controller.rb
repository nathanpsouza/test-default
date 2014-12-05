class HomeController < ApplicationController
  respond_to :html

  def index
    respond_with( @courses = CourseDecorator.decorate_collection( Course.page( params[:page] ) ) )
  end
end
