class RemoveCourseTimeFromCourses < ActiveRecord::Migration[6.0]
  def change

    remove_column :courses, :course_time, :string
  end
end
