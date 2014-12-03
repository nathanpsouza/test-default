class Student < ActiveRecord::Base
  validates :name, :rg, :cpf, :email, presence: true
  validates :email, email: true
  validates :cpf, cpf: true

  has_many :enrollments
  has_many :courses, through: :enrollments

  searchable do
    text :name
  end
end
