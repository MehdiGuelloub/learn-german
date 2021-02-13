class PracticesController < ApplicationController
	def index
		params[:month] ||= Date.today.month
		params[:year] ||= Date.today.year
		@current_date = Date.new(params[:year].to_i, params[:month].to_i)
		@month_days = @current_date.beginning_of_month.step(@current_date.end_of_month)
		@indexed_practices = Practice
			.where(date: @current_date.beginning_of_month..@current_date.end_of_month)
			.order(date: :DESC)
			.index_by(&:date)
	end
end
