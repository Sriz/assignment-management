class Teacher < ActiveRecord::Base
   attr_accessible :avatar, :first_name, :last_name, :gender, :address, :phone, :email, :avatar  
 has_attached_file :avatar

end
