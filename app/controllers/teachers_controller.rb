class TeachersController < ApplicationController
 # skip_before_filter :authenticate_user!
#before_filter :confirm_logged_in
load_and_authorize_resource
def index
 @teachers= Teacher.all
end
def new
  @teacher =Teacher.new
end

def create
  @teacher= Teacher.new(teacher_params)
  if @teacher.save
  	redirect_to @teacher
  	else
  		render('new')
  end
end
def show
	@teacher=Teacher.find(params[:id])
end

def edit
  @teacher= Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update(teacher_params)
      flash[:notice]= "Teacher details updated"
      redirect_to @teacher
    else
      render('edit')
end
  end
def destroy
    @teacher= Teacher.find(params[:id])
    @teacher.destroy
    redirect_to @teacher

  end
private
   def teacher_params
      params.require(:teacher).permit(:class_roll_no, :admission_date, :first_name, :last_name,:email, :date_of_birth, :gender, :phone, :address, 
        :photo_filename, :avatar)
    end
end



