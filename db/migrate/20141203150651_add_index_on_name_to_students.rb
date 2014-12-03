class AddIndexOnNameToStudents < ActiveRecord::Migration
  def change
    add_index :students, :name
  end
end
