class Course < ApplicationRecord
  has_many :enrollments, class_name: "Enrollment", foreign_key: "course_id"
  has_many :enrolled_students, through: :enrollments, source: :user
  belongs_to :prerequisits, class_name: "Course", foreign_key: "prereq_id"
  belongs_to :instructor, class_name: "User", foreign_key: "instructor_id"
end
