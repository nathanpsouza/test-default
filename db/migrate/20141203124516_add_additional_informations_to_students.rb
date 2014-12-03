class AddAdditionalInformationsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :email, :string, null: false

    add_column :students, :cpf, :string
    add_column :students, :rg, :string

    add_column :students, :ddd, :string
    add_column :students, :phone, :string

    add_column :students, :zip_code, :string
    add_column :students, :street, :string
    add_column :students, :number, :string
    add_column :students, :complement, :string
    add_column :students, :district, :string
    add_column :students, :city, :string
    add_column :students, :state, :string
  end
end
