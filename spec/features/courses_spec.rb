require 'rails_helper'

feature "Course management" do
  background do
    FactoryGirl.create_list(:course, 3)
    visit root_path
    click_link "Cursos"
  end

  scenario "Add a new course" do
    click_link "Novo curso"

    expect( page ).to have_content( "Cadastrar curso " )

    course = FactoryGirl.attributes_for( :course )

    expect {
      fill_in "Nome", with: course[:name]
      fill_in "Descrição", with: course[:description]

      click_button "Salvar"
    }.to change( Course, :count ).by(1)
  end

  scenario "Edit a existing course" do
    course = Course.last

    within("#course_#{course.id}") do
      click_link "Editar"
    end

    fill_in "Nome", with: "Name has been edited"
    click_button "Salvar"

    expect( page ).to have_content( "Name has been edited" )
  end

  scenario "Remove one course" do
    course = Course.last

    expect {
      within("#course_#{course.id}") do
        click_link "Remover"
      end
    }.to change(Course, :count).by(-1)
  end

  scenario "Enroll student to course", js: true do
    FactoryGirl.create_list( :student, 3 )
    sleep(5) #wait solr index

    course = Course.last
    student = Student.last
    name = student.name.truncate(5, omission: "")

    visit root_path
    click_link "Cursos"

    within("#course_#{course.id}") do
      click_link "Ver"
    end

    expect {
      fill_in "students", with: name
      sleep 3 #wait ajax request
      execute_script %Q{ $("ul.ui-autocomplete li:contains(#{student.name})").trigger('click') }
      page.driver.browser.switch_to.alert.accept
      sleep 3 #wait ajax request
    }.to change(course.students, :count).by(1)
  end

  scenario "Cancel enrollment for user", js: true do
    course = Course.last
    enrollment = course.enrollments.create(student: FactoryGirl.create(:student))
    course.reload

    visit root_path
    click_link "Cursos"

    within("#course_#{course.id}") do
      click_link "Ver"
    end

    expect {
      within "#enrollment_#{enrollment.id}" do
        click_link "Remover"
      end

      page.driver.browser.switch_to.alert.accept
      sleep 3 #wait ajax request
    }.to change(course.students, :count).by(-1)
  end
end