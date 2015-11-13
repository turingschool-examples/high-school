require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def create_students_for_grade(grade_level, number_of_students)
    grade = Grade.create(level: grade_level)
    number_of_students.times do |i| 
      grade.students.create(first_name: "Generic", last_name: "Student#{i}")
    end
  end
  
  test "school email address is generated" do
    student = Student.create(first_name: "Edna", last_name: "Jones")

    assert_equal "edna_jones@dpsk12.edu", student.email_address
  end

  test ".in_grade returns collection of students for specific grade" do
    create_students_for_grade(11, 3)
    create_students_for_grade(12, 1)

    assert_equal 3, Student.by_grade(11).count
    assert_equal 1, Student.by_grade(12).count
  end
end
