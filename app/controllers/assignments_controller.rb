class AssignmentsController < ApplicationController
 #load_and_authorize_resource
 def index
 	@assignments=Assignment.all
 end
 def walla
 end
 def show
  @a=Assignment.find_by_deadline(:subj_id)
  if Time.new.to_s(:db) < @a.to_s 
  puts "lau khaa"   	 
  else
    puts "impossible"
  end
    @assignment=Assignment.where("subject_id=?",params[:subj_id])

   @subject= Subject.where("id=?", params[:subj_id])
  ####preeviously used 
#  subjects=Subject.find_by_name(params[:id])
# 	@subject=subjects.assignments

  ##### over previously used
# 	assignment=Assignment.find(1)
# 	@assignment=@assignments.subject
  @user=User.find(1)
  
  # @sub=user.subjects.semester 
 #	@assignment=Assignment.find(1)
  #  @ass = AssignmentEdit.find(1)

 #@assignment= Assignment.subject[:id]
 end

def new
#  load_and_authorize_resource
  #@subjects=Subject.find_by_name(params[:id])

  @assignment =Assignment.new
#  @subjects=Subject.all
  authorize!  :create, @assignment
end
def view
@ass=AssignmentEdit.find(params[:id])
 
  end

def create
  @assignment= Assignment.new(assignment_params)

  if @assignment.save
  	flash[:notice]= "Assignment details updated"
  	#render('new')
    redirect_to :action => 'show', :id => params[:id], :subj_id => params[:subj_id]

    #redirect_to @assignment , :id => params[:subj_id], :subj_id => params[:subj_id]
  	else
  		render('new')
  end
end

def edit
  @assignment= Assignment.find(params[:id])
  end

  def update
    @assignment = Assignment.find(params[:id])
    if @assignment.update(assignment_params)
      flash[:notice]= "Assignment details updated"
      redirect_to @assignment
    else
      render('edit')
end
  end
def destroy
    @assignment= Assignment.find(params[:id])
    @assignment.destroy
    redirect_to @assignment

  end
private
   def assignment_params
      params.require(:assignment).permit(:body, :title, :created_at, :subject_id, :avatar, :assignment_edits, :user_id, :deadline, :marks)
    end








end
