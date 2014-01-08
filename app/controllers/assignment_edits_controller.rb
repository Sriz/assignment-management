class AssignmentEditsController < ApplicationController
#load_and_authorize_resource
#require 'zip/zip'
#require 'zip/zipfilesystem'
def view
  @assign=AssignmentEdit.where("assignment_id= ?", params[:id])
authorize!  :view, @assign

end
def show
 @assign=AssignmentEdit.find(params[:as_id])
  
 #Assignment.all(:conditions => ["deadline <= ?", Date.today])
  #@assign=AssignmentEdit.find(params[:id])
  #redirect_to @assign
 # render('index')
end
def index
  #@subject=Subject.all
  ##@a= AssignmentEdit.all
  #@assign= Assignment.all
 # @assign =AssignmentEdit.assignment_id
end

 def download
 # @assign=AssignmentEdit.where("assignment_id= ?", params[:id])


upload = AssignmentEdit.find(params[:id])
send_file upload.avatar.path,
            :filename => upload.avatar_file_name,
            :type => upload.avatar_content_type,
            :disposition => 'attachment'
flash[:notice] = "Your file has been downloaded"


# @assign=AssignmentEdit.find(1)
   
#     @submissions=@assign.avatar_file_name.all

#     file = @assign.avatar.url(:original, false)

#     Zip::ZipFile.open(file, create=nil) do |zipfile|
#       @submissions.each do |filename|
#         zipfile.add(filename.avatar_file_name, filename.avatar.url(:original, false))
#       end
#     end
  end

def new
	@assign=AssignmentEdit.new
	
	end
def create
	#	@subjects=Subject.find_by_name(params[:id])
 @a=Assignment.where("id=?",params[:as_id])
 @a.each do |k|
  if Time.now.to_s(:db) < k.deadline.to_s 
    @assign= AssignmentEdit.new(assign_params)

  if @assign.save
#   redirect_to :action => 'show', :id => params[:id], :subj_id => params[:subj_id]
    flash[:notice]="Successfully Added"
    else
      render('index')
  end


    else
    flash[:notice] = "C'mon, Seriously?"
  end
end
end

private
   def assign_params
      params.require(:assignment_edits).permit(:avatar,:assignment_id, :subject_id, :user_id)
    end
end
