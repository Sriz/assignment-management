class Assignment < ActiveRecord::Base
  belongs_to :subject  
  belongs_to :user
    has_many :assignment_edits
    has_many :users, :through => :assignment_edits
attr_accessible :title, :body, :subject_id, :user_id, :created_at, :deadline, :marks
end
