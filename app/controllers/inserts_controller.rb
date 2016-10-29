class InsertsController < ApplicationController
	def new
		@insert = Insert.new
	end

	def create
		@insert = Insert.new(insert_params)

		if @insert.save
			redirect_to @insert
		else
			render 'new'
		end
	end

	def show
		@insert = Insert.find(params[:id])
		respond_to do |format|
			format.html
			format.pdf do
				pdf = InsertPdf.new(@insert)
				send_data pdf.render, filename: '#{@insert.name}_AB_596',
										type: "application/pdf",
										disposition: "inline"
			end
		end
	end

	private
		def insert_params
			params.require(:insert).permit(:name, :hoa_classification, :hud_id, :month_hud_expiration, :day_hud_expiration, :year_hud_expiration, :va_id, :approved)
		end
end
