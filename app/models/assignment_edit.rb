class AssignmentEdit < ActiveRecord::Base
  belongs_to :user
  belongs_to :assignment
has_attached_file :avatar
attr_accessible :avatar,:subject_id, :user_id, :assignment_id

def download
    send_file '/home/railsway/huge.zip', :type=>"application/zip" 
  end
end
