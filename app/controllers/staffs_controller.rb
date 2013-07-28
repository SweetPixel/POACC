class StaffsController < ApplicationController
	def index
		@staff = Staff.all
	end

	def show
	end
end
