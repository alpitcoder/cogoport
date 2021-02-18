class CreateStudent < ActiveInteraction::Base
  string :first_name, :last_name, :email, :date_of_birth

  validates :first_name, :last_name, :email, :date_of_birth,
    presence: true

  def to_model
    Student.new
  end

  def execute
    student = Student.new(inputs)

    unless student.save
      errors.merge!(student.errors)
    end

    student
  end
end
