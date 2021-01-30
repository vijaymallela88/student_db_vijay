class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  # skip_before_action :authenticate_user!, only: [:new, :create]
  # layout false, only: [:new, :create]
  
  def index
    @students = Student.where(:status => "created")
  end

  
  def show
  end

  def new
    @student = Student.new
  end

  def pending_students
    @students = Student.where(:status => "pending")
  end

  def approve_student
      @student = Student.find(params[:format])
      if @student.update(:status => "created")
        flash[:notice] = "Approved Successfully"
        redirect_to students_path
      else
        flash[:notice] = "Not Approved"
        redirect_to students_pending_students_path
      end
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    if user_signed_in?
      @student.update(:status => "created")
    else
      @student.update(:status => "pending")
    end
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:full_name, :address, :mobile, :institution_id, :status)
    end
end
