crumb :root do
  link "Cadastro de estudantes", root_path
end

###
# Courses
###
crumb :courses do
  link "Cursos", courses_path
end

crumb :course do |course|
  link course.name, course_path(course)
  parent :courses
end

crumb :new_course do
  link "Cadastrar", new_course_path
  parent :courses
end

crumb :edit_course do | course |
  link "Editar", edit_course_path(course)
  parent :course, course
end

###
# Students
###
crumb :students do
  link "Estudantes", students_path
end

crumb :student do |student|
  link student.name, student_path(student)
  parent :students
end

crumb :new_student do
  link "Cadastrar", new_student_path
  parent :students
end

crumb :edit_student do | student |
  link "Editar", edit_student_path(student)
  parent :student, student
end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).