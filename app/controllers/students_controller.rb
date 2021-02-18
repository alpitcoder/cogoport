class StudentsController < ApplicationController

  def index
    @students = ListStudents.run!
  end

  def show
    @student = find_student!
  end

  def new
    @student = CreateStudent.new
  end

  def create
    outcome = CreateStudent.run(params.fetch(:student, {}))

    if outcome.valid?
      redirect_to(outcome.result)
    else
      @student = outcome
      render(:new)
    end
  end

  def destroy
    DestroyStudent.run!(student: find_student!)
    redirect_to(students_url)
  end

  def edit
    student = find_student!
    @student = UpdateStudent.new(
      student: student,
      first_name: student.first_name,
      last_name: student.last_name,
      email: student.email,
      date_of_birth: student.date_of_birth)
  end

  def update
    inputs = { student: find_student! }.reverse_merge(params[:student])
    outcome = UpdateStudent.run(inputs)

    if outcome.valid?
      redirect_to(outcome.result)
    else
      @student = outcome
      render(:edit)
    end
  end

  def sort
    @students = SortStudents.run!
  end

  private

  def find_student!
    outcome = FindStudent.run(params)

    if outcome.valid?
      outcome.result
    else
      fail ActiveRecord::RecordNotFound, outcome.errors.full_messages.to_sentence
    end
  end
end
