class UpdateStudent < ActiveInteraction::Base
  object :student

  string :first_name, :last_name, :email, :date_of_birth,
    default: nil

  # validates :first_name,
  #   presence: true,
  #   unless: 'first_name.nil?'
  # validates :last_name,
  #   presence: true,
  #   unless: 'last_name.nil?'
  # validates :email,
  #   presence: true,
  #   unless: 'email.nil?'
  # validates :date_of_birth,
  #   presence: true,
  #   unless: 'date_of_birth.nil?'

  def execute
    student.first_name = first_name if first_name.present?
    student.last_name = last_name if last_name.present?
    student.email = email if email.present?
    student.date_of_birth = date_of_birth if date_of_birth.present?

    unless student.save
      errors.merge!(student.errors)
    end

    student
  end
end
