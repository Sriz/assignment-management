class PostsController < ApplicationController
  skip_before_filter :authenticate_user!
  #before_filter :confirm_logged_in

 def index
 end
  def new
  end
end
