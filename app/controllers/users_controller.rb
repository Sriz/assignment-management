class UsersController < ApplicationController

skip_before_filter :authenticate_user!

  #layout 'admin'
  before_filter :confirm_logged_in


 def index
 @users= User.all
end

  
  def new
    
  @user =User.new
 
 
end

def create
  @user= User.new(user_params)
  if @user.save
  	redirect_to @user
  	else
  		render('new')
  end
end
def show
  @user = User.find(params[:id])
end

def edit
  @user= User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]= "User details updated"
      redirect_to @user
    else
      render('edit')
end
  end
def destroy
    @user= User.find(params[:id])
    @user.destroy
    redirect_to @user

  end
private
   def user_params
      params.require(:user).permit(:email, :batch_id, :password,:class_roll_no, :first_name, :last_name, :gender,:role ,:encrypted_password, :reset_password, :sign_in_count, :current_sign_in_at, :reset_password_sent_at, :remember_created_at, :last_sign_in_at, :created_at, :updated_at)

end
end