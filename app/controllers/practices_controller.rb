class PracticesController < ApplicationController

	def index
		@practices = Practice.all
		@json = Practice.all.to_gmaps4rails
	end

end
