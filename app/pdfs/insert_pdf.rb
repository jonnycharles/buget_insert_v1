class InsertPdf < Prawn::Document
	def initialize(insert)
		super(top_margin: 70, left_margin: 60, right_margin: 60)
		@insert = insert
		first_label_first_page
		move_down 50
		first_paragraph_first_page
		move_down 20
		second_paragraph_first_page
		move_down 20
		third_paragraph_first_page
		move_down 20
		fourth_paragraph_first_page
		move_down 100
		insert_name
		move_down 20
		hud_id_logic
		fha_status_and_date
		move_down 125
		generate_condo_approvals_footer
		insert_disclaimer
		move_down 1000
		first_label_second_page
		move_down 50
		first_paragraph_second_page
		move_down 20
		second_paragraph_second_page
		move_down 20
		third_paragraph_second_page
		move_down 20
		fourth_paragraph_second_page
		move_down 100
		insert_name
		move_down 20
		va_id_logic
		va_status
		va_expiration_date
		move_down 145
		generate_condo_approvals_footer
		insert_disclaimer

	end

	#hoa information
	def insert_name
		text "Condominium Name: #{@insert.name}", size: 12, style: :bold
	end
\

	#first page
	#first label
	def first_label_first_page
		text "FHA Condominium Approval Status", size: 18, style: :italic
	end

	#first paragraph
	def first_paragraph_first_page
		text "California State Statute requires the disclosure of your HOA’s FHA and VA approval status to unit owners.  This information is deemed accurate at the time of this disclosure.  However HUD/FHA may change the status without further notice.
", size: 12; 
	end

	#second paragraph
	def second_paragraph_first_page
		text "Certification by the Federal Housing Administration may provide benefits to members of an association, including an improvement in an owner’s ability to refinance a mortgage or obtain secondary financing and an increase in the pool of potential buyers of the separate interest.", size: 14, style: :bold
	end

	#third paragraph logic
	def third_paragraph_first_page
		if ("#{@insert.hoa_classification}" == "Condo") && ("#{@insert.approved}" == "1")
			text "This common interest development IS a condominium project.  The association of this common interest development IS certified by the Federal Housing Administration.", size: 14, style: :bold
		elsif ("#{@insert.hoa_classification}" == "Condo") && ("#{@insert.approved}" == "0")
			text "This common interest development IS a condominium project.  The association of this common interest development IS NOT certified by the Federal Housing Administration.", size: 14, style: :bold
		else
			text "This common interest development IS NOT a condominium project.  The association of this common interest development IS NOT certified by the Federal Housing Administration.", size: 14, style: :bold
		end
	end

	#fourth paragraph
	def fourth_paragraph_first_page
		text "As of now, certification by Federal Housing Administration only lasts for two years.", size: 14, style: :bold
	end

	#second page
	#first label
	def first_label_second_page
		text "VA Condominium Approval Status", size: 18, style: :italic
	end

	#first paragraph
	def first_paragraph_second_page
		text "California State Statute requires the disclosure of your HOA’s VA approval status to unit owners.  This information is deemed accurate at the time of this disclosure.", size: 12
	end

	#second paragraph
	def second_paragraph_second_page
		text "Certification by the federal Department of Veterans Affairs may provide benefits to members of an association, including an improvement in an owner’s ability to refinance a mortgage or obtain secondary financing and an increase in the pool of potential buyers of the separate interest.", size: 14, style: :bold
	end

	#third pargraph logic
	def third_paragraph_second_page
		if ("#{@insert.hoa_classification}" == "Condo") && ("#{@insert.va_id}".downcase == "none")
			text "This common interest development IS a condominium project. The association of this common interest development IS NOT certified by the federal Department of Veterans Affairs.
", size: 14, style: :bold
		elsif ("#{@insert.hoa_classification}" == "Condo") && ("#{@insert.va_id}" == "")
			text "This common interest development IS a condominium project. The association of this common interest development IS NOT certified by the federal Department of Veterans Affairs.
", size: 14, style: :bold
		elsif ("#{@insert.hoa_classification}" != "Condo")
			text "This common interest development IS NOT a condominium project. The association of this common interest development IS NOT certified by the federal Department of Veterans Affairs.
", size: 14, style: :bold
		else
			text "This common interest development IS a condominium project. The association of this common interest development IS certified by the federal Department of Veterans Affairs.", size: 14, style: :bold
		end	
	end

	#fourth paragraph 
	def fourth_paragraph_second_page
		text "As of now, certification by the federal Department of Veterans Affairs does not expire.", size: 14, style: :bold
	end

	#fha status and date
	def fha_status_and_date
		if ("#{@insert.hoa_classification}" == "Condo") && ("#{@insert.approved}" == "1")
			text "FHA Status: Approved", size: 12, style: :bold
			if ("#{@insert.month_hud_expiration}" != "") && ("#{@insert.day_hud_expiration}" != "") && ("#{@insert.year_hud_expiration}" != "")
				text "Expiration of FHA Approval: #{@insert.month_hud_expiration}/#{@insert.day_hud_expiration}/#{@insert.year_hud_expiration}", size: 12, style: :bold
			else
				text "Expiration of FHA Approval: Expiration Date Not Given", size: 12, style: :bold
			end
		elsif ("#{@insert.hoa_classification}" == "Condo") && ("#{@insert.approved}" == "0") && ("#{@insert.hud_id}" != "")
			text "FHA Status: Expired", size: 12, style: :bold
			if ("#{@insert.month_hud_expiration}" != "") && ("#{@insert.day_hud_expiration}" != "") && ("#{@insert.year_hud_expiration}" != "")
				text "Expiration of FHA Approval: Expired on #{@insert.month_hud_expiration}/#{@insert.day_hud_expiration}/#{@insert.year_hud_expiration}", size: 12, style: :bold
			else
				text "Expiration of FHA Approval: Expiration Date Not Given", size: 12, style: :bold
			end
		elsif ("#{@insert.hoa_classification}" == "Condo") && ("#{@insert.approved}" == "0") && ("#{@insert.hud_id}" == "")
			text "FHA Status: None", size: 12, style: :bold
			text "Expiration of FHA Approval: Never Approved", size: 12, style: :bold
		elsif ("#{@insert.hoa_classification}" != "Condo")
			text "FHA Status: Not Approvable By HUD", size: 12, style: :bold
			text "Expiration of FHA Approval: Does Not Apply", size: 12, style: :bold
		else
			text "FHA Status: Not Known", size: 12, style: :bold
			text "Expiration of FHA Approval: Expiration Date Not Given", size: 12, style: :bold
		end
	end

	#va status and date
	def va_status
		if ("#{@insert.hoa_classification}" == "Condo") && ("#{@insert.va_id}" == "")
			text "VA Status: Not Approved", size: 12, style: :bold
		elsif ("#{@insert.hoa_classification}" == "Condo") && ("#{@insert.va_id}".downcase == "none")
			text "VA Status: Not Approved", size: 12, style: :bold
		elsif ("#{@insert.hoa_classification}" != "Condo")
			text "VA Status: Not Approved", size: 12, style: :bold
		else
			text "VA Status: Approved", size: 12, style: :bold
		end
	end

	#va expiration date
	def va_expiration_date
		text "VA Expiration Date: VA Approval Is Permanent", size: 12, style: :bold
	end



	#expiration date logic
	def expiration_date_logic
		if (@insert.month_hud_expiration != nil)
				text "Expiration Date: #{@insert.month_hud_expiration}/#{@insert.day_hud_expiration}/#{@insert.year_hud_expiration}", size: 12
			 else 
				text "Expiration Date: None", size: 12
		end
	end

	#hud id logic
	def hud_id_logic
		if ("#{@insert.hud_id}" == "") || ("#{@insert.hud_id}".downcase == "none")
			text "FHA ID: None", size: 12, style: :bold  
		else	
			text "FHA ID: #{@insert.hud_id}", size: 12, style: :bold
		end
	end

	#va id logic
	def va_id_logic
		if ("#{@insert.va_id}".downcase == "none") || ("#{@insert.va_id}" == "")
			text "VA ID Number: None", size: 12, style: :bold
		else
			text "VA ID: #{@insert.va_id}", size: 12, style: :bold
		end
	end

	def insert_disclaimer
		font "Times-Roman"
		text "Please Note:  The above information was printed on a web application provided by Condo Approvals, LLC.  The information was entered independently and without oversite from Condo Approvals, LLC.  Condo Approvals, LLC makes no warranties regarding the veracity of the information.  If you have questions regarding the information input and displayed by this application please contact members of your Board of Directors.", size: 8, style: :italic, align: :justify
	end


	#headers and footers
	def generate_condo_approvals_footer
		text "Certification Website Provided by CONDO APPROVALS, LLC", size: 14, align: :center
		text "www.condoprescreen.com / Condo Approvals Phone Number:  310-896-2377", size: 10, align: :center
	end

	

end