class Student < ActiveRecord::Base
 attr_accessible :avatar, :first_name, :last_name, :date_of_birth, :gender, :address, :phone, :email, :avatar  
 has_attached_file :avatar
   end
