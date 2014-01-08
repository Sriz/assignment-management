class SubjectsController < ApplicationController
 skip_before_filter :authenticate_user!
 before_filter :confirm_logged_in
 # load_and_authorize_resource
  def index
    list
    render('list')
  end


  def show
   # @subject= Subject.where(:semester =>'4')
    @subject = Subject.find(params[:id])
  end


  def list
    #@subjects=Subject.find_by_name("Maths")
    @subjects=Subject.order("subjects.semester ASC")
  end

  def new
    @subject=Subject.new
   end

      
  def create
  @subject=Subject.new(subject_params)
    if @subject.save
      redirect_to @subject
    else
      render('new')
    end
  end
  def edit
    @subject= Subject.find(params[:id])
  end  
  def update
   # new_position = params[:subject].delete(:position)
    # Find object using form parameters
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update(subject_params)
         # If update succeeds, redirect to the list action
      flash[:notice] = "Subject updated."
      redirect_to @subject
    else
      # If save fails, redisplay the form so user can fix problems
      @subject_count = Subject.count
      render(' edit')
    end
  end


    def destroy
      @subject= Subject.find(params[:id])
      @subject.destroy
    redirect_to @subject
  end 

private
   def subject_params
      params.require(:subject).permit(:name,:semester, :visible)
    end
end