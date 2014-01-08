class StudentsController < ApplicationController
# skip_before_filter :authenticate_user!
#before_filter :confirm_logged_in

load_and_authorize_resource
def index
 @students= Student.all
end

  
  def new
    
  @student =Student.new
 
 
end

def create
  @student= Student.new(student_params)
  if @student.save
  	redirect_to @student
  	else
  		render('new')
  end
end
def jpt
  @student= Student.all
  end
def show
	@student=Student.find(params[:id])
end

def edit
  @student= Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      flash[:notice]= "Student details updated"
      redirect_to @student
    else
      render('edit')
end
  end
def destroy
    @student= Student.find(params[:id])
    @student.destroy
    redirect_to @student

  end
private
   def student_params
      params.require(:student).permit(:class_roll_no, :admission_date, :first_name, :last_name,:email, :date_of_birth, :gender, :phone, :address, 
        :photo_filename, :avatar)
    end
end
