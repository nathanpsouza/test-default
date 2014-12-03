class StudentsController < ApplicationController
  respond_to :html, :json

  before_action :find_student, except: [:index, :new, :create, :search]

  def index
    respond_with( @students = StudentDecorator.decorate_collection( Student.page( params[:page] ) ) )
  end

  def search
    query = Sunspot.search [Student] do
      fulltext params[:q]
    end

    respond_with( @results = query.results )
  end

  def show
    respond_with( @student = @student.decorate )
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
    params.require( :student ).permit( :name, :email, :cpf, :rg, :ddd, :phone, :zip_code, :street, :number, :complement, :district, :city, :state  )
  end

  def find_student
    @student = Student.find( params[:id] )
  end
end
