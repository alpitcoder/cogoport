class FindStudent < ActiveInteraction::Base
  integer :id

  def execute
    student = Student.find_by_id(id)

    if student
      student
    else
      errors.add(:id, 'does not exist')
    end
  end
end
