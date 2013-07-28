class PracticesController < ApplicationController

	def index
		@practices = Practice.all
	end

end
