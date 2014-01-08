class AdminUsersController < ApplicationController
  skip_before_filter :authenticate_user!
before_filter :confirm_logged_in, :except => [:login, :attempt_login, :logout]

  #layout 'admin'
 # before_filter :confirm_logged_in
 def index
 @admin_users= AdminUser.all
end

  
  def new
    
  @admin_user =AdminUser.new
 
 
end

def create
  @admin_user= AdminUser.new(admin_user_params)
  if @admin_user.save
  	redirect_to @admin_user
  	else
  		render('new')
  end
end
def show
  @admin_user = AdminUser.find(params[:id])
end

def edit
  @admin_user= AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update(admin_user_params)
      flash[:notice]= "AdminUser details updated"
      redirect_to @admin_user
    else
      render('edit')
end
  end
def destroy
    @admin_user= AdminUser.find(params[:id])
    @admin_user.destroy
    redirect_to @admin_user

  end
private
   def admin_user_params
      params.require(:admin_user).permit(:username, :password,:email)
    end
end
