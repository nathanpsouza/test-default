class StudentsController < ApplicationController
  respond_to :html

  before_action :find_student, except: [:index, :new, :create]

  def index
    respond_with( @students = Student.all )
  end

  def show
    respond_with( @student )
  end

  def new
    respond_with( @student = Student.new )
  end

  def create
    @student = Student.new( student_params )
    flash[:notice] = "Estudante cadastrado" if @student.save
    respond_with( @student )
  end

  def edit
    respond_with( @student )
  end

  def update
    flash[:notice] = "Estudante atualizado" if @student.update_attributes( student_params )
    respond_with( @student )
  end

  def destroy
    flash[:notice] = "Estudante Removido" if @student.destroy
    respond_with( @student )
  end

  private
  def student_params
    params.require( :student ).permit( :name )
  end

  def find_student
    @student = Student.find( params[:id] )
  end
end
