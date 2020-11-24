class PracticesController < ApplicationController
	def index
		@practices = Practice.order(date: :DESC)
	end
end
