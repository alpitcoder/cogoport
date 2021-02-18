class ListStudents < ActiveInteraction::Base
  def execute
    Student.all
  end
end
