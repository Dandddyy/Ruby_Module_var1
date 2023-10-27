require 'date'
class Student
  attr_accessor :id, :last_name, :first_name, :middle_name, :birth_date, :address, :phone, :faculty, :course, :group

  def initialize(id, last_name, first_name, middle_name, birth_date, address, phone, faculty, course, group)
    @id = id
    @last_name = last_name
    @first_name = first_name
    @middle_name = middle_name
    @birth_date = birth_date
    @address = address
    @phone = phone
    @faculty = faculty
    @course = course
    @group = group
  end

  def to_s
    "#{id}: #{last_name} #{first_name} #{middle_name}, Date of Birth: #{birth_date}, Address: #{address}, Phone: #{phone}, Faculty: #{faculty}, Course: #{course}, Group: #{group}"
  end
end

class StudentDatabase
  def initialize
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def students_by_faculty(faculty)
    @students.select { |student| student.faculty == faculty }
  end

  def students_by_faculty_and_course(faculty, course)
    @students.select { |student| student.faculty == faculty && student.course == course }
  end

  def students_born_after(year)
    @students.select { |student| student.birth_date.year > year }
  end

  def students_by_group(group)
    @students.select { |student| student.group == group }
  end
end


db = StudentDatabase.new

db.add_student(Student.new(1, "Ivanov", "Ivan", "Ivanovych", Date.new(2000, 5, 10), "Adress 1", "123-456-789", "Faculty 1", 1, "Group A"))
db.add_student(Student.new(2, "Petrov", "Petro", "Petrovych", Date.new(2001, 8, 15), "Adress 2", "987-654-321", "Faculty 2", 2, "Group B"))
db.add_student(Student.new(3, "Sydorov", "Ihor", "Ihorevych", Date.new(1999, 3, 20), "Adress 3", "555-123-777", "Faculty 1", 3, "Group A"))

puts "List of students by Faculty 1:"
db.students_by_faculty("Faculty 1").each { |student| puts student }

puts "\nList of students by faculties and courses:"
(1..3).each do |course|
  (1..2).each do |faculty_num|
    faculty = "Faculty #{faculty_num}"
    puts "Faculty: #{faculty}, Course: #{course}:"
    db.students_by_faculty_and_course(faculty, course).each { |student| puts student }
  end
end

puts "\nList of students born after 2000:"
db.students_born_after(2000).each { |student| puts student }

puts "\nList of students of group A:"
db.students_by_group("Group A").each { |student| puts student }
