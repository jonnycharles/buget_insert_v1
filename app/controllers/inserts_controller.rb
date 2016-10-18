class InsertsController < ApplicationController
	def new
		@insert = Insert.new
	end

	def create
		@insert = Insert.new(insert_params)

		@insert.save
		redirect_to @insert
	end

	def show
		@insert = Insert.find(params[:id])
	end

	private
		def insert_params
			params.require(:insert).permit(:name, :hoa_classification, :hud_id, :month_hud_expiration, :day_hud_expiration, :year_hud_expiration, :va_id, :approved)
		end
end
