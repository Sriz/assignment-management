class PublicController < ApplicationController
def index
end
def show
	@subject= Subject.where(:semester =>params[:id])	
	end

end
