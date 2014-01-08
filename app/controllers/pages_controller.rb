class PagesController < ApplicationController
	skip_before_filter :authenticate_user!
before_filter :confirm_logged_in
end
