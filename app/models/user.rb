class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
    has_many :subjects
    has_many :assignments, :through => :assignment_edits
    has_many :assignment_edits
   has_attached_file :avatar
    validates_attachment :avatar,
  :content_type => { :content_type => ["image/jpg", "image/gif", "image/png"] }


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :avatar,:email, :batch_id,:password, :first_name,:last_name, :class_roll_no, :gender, :remember_me, :role
 # ROLES=%w[student teacher]
end
