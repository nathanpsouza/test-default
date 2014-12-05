require 'rails_helper'

feature "Student management" do
  background do
    FactoryGirl.create_list(:student, 3)
    visit root_path
    click_link "Estudantes"
  end

  scenario "Add a new student" do
    click_link "Novo estudante"

    expect( page ).to have_content( "Cadastrar estudante " )

    student = FactoryGirl.attributes_for( :student )

    expect {
      fill_in "Nome", with: student[:name]
      fill_in "CPF", with: "366.839.722-81"
      fill_in "RG", with: "123468540"
      fill_in "Email", with: student[:email]

      click_button "Salvar"
    }.to change( Student, :count ).by(1)
  end

  scenario "Edit a existing student" do
    student = Student.last

    within("#student_#{student.id}") do
      click_link "Editar"
    end

    fill_in "Nome", with: "Name has been edited"
    click_button "Salvar"

    expect( page ).to have_content( "Name has been edited" )
  end

  scenario "Remove one course" do
    student = Student.last

    expect {
      within("#student_#{student.id}") do
        click_link "Remover"
      end
    }.to change(Student, :count).by(-1)
  end
end