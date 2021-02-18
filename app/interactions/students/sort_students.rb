class SortStudents < ActiveInteraction::Base
  def execute
    Student.order(first_name: :asc,created_at: :asc)
  end
end
