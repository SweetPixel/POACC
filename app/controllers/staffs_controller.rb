class StaffsController < ApplicationController
	def index
		@staff = Staff.all
	end

	def show
		@staff = Staff.find(params[:id])
	end
end
