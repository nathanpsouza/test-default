class CoursesController < ApplicationController
  respond_to :html, :js

  before_action :find_course, except: [:index, :new, :create]

  def index
    respond_with( @courses = CourseDecorator.decorate_collection( Course.page( params[:page] ) ) )
  end

  def show
    respond_with( @course = @course.decorate )
  end

  def new
    respond_with( @course = Course.new )
  end

  def create
    @course = Course.new( course_params )
    flash[:notice] = "Curso cadastrado" if @course.save
    respond_with( @course )
  end

  def enroll
    course = Course.find( params[:id] )
    student = Student.find( params[:student_id] )

    if course.enrollments.where(student: student).empty?
      @enrollment = course.enrollments.create(student: student).decorate
      @link_to_see = view_context.link_to "Ver", student_path( student ), class: "btn btn-xs btn-default"
      @link_to_remove = view_context.link_to "Remover", cancel_enrollment_course_path( course, @enrollment ), class: "btn btn-xs btn-danger", method: :delete, remote: true,  data: { confirm: "Você tem certeza?" }
    else
      @already_enrolled = true
    end
  end

  def cancel_enrollment
    course = Course.find( params[:id] )

    @enrollment = course.enrollments.find( params[:enrollment_id] )
    @enrollment.destroy
  end

  def edit
    respond_with( @course )
  end

  def update
    flash[:notice] = "Estudante curso" if @course.update_attributes( course_params )
    respond_with( @course )
  end

  def destroy
    flash[:notice] = "Estudante Removido" if @course.destroy
    respond_with( @course )
  end

  private
  def course_params
    params.require( :course ).permit( :name, :description )
  end

  def find_course
    @course = Course.find( params[:id] )
  end
end
