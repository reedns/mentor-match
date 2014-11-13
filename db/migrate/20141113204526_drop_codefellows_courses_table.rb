class DropCodefellowsCoursesTable < ActiveRecord::Migration
  def change
    drop_table :codefellows_courses
  end
end
