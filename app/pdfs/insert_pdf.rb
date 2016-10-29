class InsertPdf < Prawn::Document
	def initialize(insert)
		super(top_margin: 70, left_margin: 60, right_margin: 60)
		@insert = insert
		insert_condo_approvals
		insert_disclaimer
		move_down 400
		insert_footer
		move_down 100
		insert_condo_approvals
		move_down 50
		insert_name
		insert_hud_id
		insert_expiration_date
		move_down 50
		first_paragraph_second_page
		move_down 50
		second_paragraph_second_page
		move_down 50
		third_paragraph_second_page
		move_down 250
		insert_footer
		move_down 100
		insert_condo_approvals
		move_down 50
		insert_name
		insert_va_id
		move_down 50
		first_paragraph_third_page
		move_down 50
		second_paragraph_third_page
		move_down 50
		third_paragraph_third_page
		move_down 265
		insert_footer
		move_down 100
		insert_condo_approvals
		move_down 10
		first_question
		move_down 10
		first_answer
		move_down 10
		second_question
		move_down 10
		second_answer
		move_down 10
		third_question
		move_down 10
		third_answer
		move_down 10
		fourth_question
		move_down 10
		fourth_answer
		move_down 10
		fifth_question
		move_down 10
		first_answer


	end

	#hoa information
	def insert_name
		text "Attention: #{@insert.name}", size: 13
	end

	def insert_hud_id
		hud_id_logic
		#text "HUD ID Number: #{@insert.hud_id}", size: 13
	end

	def insert_expiration_date
		expiration_date_logic
		#text "Expiration Date: #{@insert.month_hud_expiration}/#{@insert.day_hud_expiration}/#{@insert.year_hud_expiration}", size: 13
	end

	def insert_va_id
		va_id_logic
		#text "VA ID Number: #{@insert.va_id}", size: 13
	end

	#first page
	def insert_disclaimer
		move_down 150
		font "Times-Roman"
		text "Disclaimer: Condo Approvals does not endorse the information shown below. For more information about your association, please email us at condoapprovals@condoapprovalsllc.com", size: 18, style: :italic, align: :justify
	end

	#second page
	#first paragraph
	def first_paragraph_second_page
		text "Certification by the Federal Housing Administration may provide benefits to members of an association, including an improvement in an owner’s ability to refinance a mortgage or obtain secondary financing and an increase in the pool of potential buyers of the separate interest.", size: 13
	end

	#second paragraph logic
	def second_paragraph_second_page
		if ("#{@insert.hoa_classification}" == "Condo") && ("#{@insert.approved}" == "1")
			text "This common interest development IS a condominium project.  The association of this common interest development IS certified by the Federal Housing Administration.", size: 13
		elsif ("#{@insert.hoa_classification}" == "Condo") && ("#{@insert.approved}" == "0")
			text "This common interest development IS a condominium project.  The association of this common interest development IS NOT certified by the Federal Housing Administration.", size: 13
		else
			text "This common interest development IS NOT a condominium project.  The association of this common interest development IS NOT certified by the Federal Housing Administration.", size: 13
		end
	end

	#third paragraph
	def third_paragraph_second_page
		text "As of now, certification by Federal Housing Administration only lasts for two years.", size: 13, style: :bold
	end

	#third page
	#first paragraph
	def first_paragraph_third_page
		text "Certification by the federal Department of Veterans Affairs may provide benefits to members of an association, including an improvement in an owner’s ability to refinance a mortgage or obtain secondary financing and an increase in the pool of potential buyers of the separate interest.", size: 13
	end

	#second pargraph logic
	def second_paragraph_third_page
		if ("#{@insert.hoa_classification}" == "Condo") && ("#{@insert.va_id}.downcase" != "none")
			text "This common interest development IS a condominium project. The association of this common interest development IS NOT certified by the federal Department of Veterans Affairs.", size: 13
		elsif ("#{@insert.hoa_classification}" == "Condo") && ("#{@insert.va_id}.downcase" == "none")
			text "This common interest development IS a condominium project. The association of this common interest development IS NOT certified by the federal Department of Veterans Affairs.
", size: 13
		else
			text "This common interest development IS NOT a condominium project. The association of this common interest development IS NOT certified by the federal Department of Veterans Affairs.
", size: 13
		end	
	end

	#third paragraph 
	def third_paragraph_third_page
		text "As of now, certification by the federal Department of Veterans Affairs does not expire.", size: 13, style: :bold
	end

	#fourth page
	def first_question
		text "Why HUD/FHA approval?  What does it mean to your association?", size: 10, style: :italic
	end

	def first_answer
		text "Answer: HUD/FHA approval is one of the three types of major lending approvals that you maintain for your association. Approximately 28% of all mortgages are FHA loans. If you allow your HUD/FHA approval to lapse, then you are excluding yourself from an entire group of people who may wish to own in your association, utilizing an FHA loan, and, thereby driving down the price of your homes. Even if an offer to purchase from an FHA buyer is not accepted, by virtue that the offer is made, the property value will improve.", size: 10
	end

	def second_question
		text "Why does the Board need to contemplate this approval instead of a Realtor or Loan Officer?", size: 10, style: :italic
	end

	def second_answer
		text "Answer: HUD/FHA approval is not instantaneous.  A well informed Board of Directors will understand that the process of HUD/FHA approval takes time. Most Realtors and sellers of units will not entertain an FHA offer on a piece of property unless the Homeowners Association is already HUD/FHA approved. You may have been fortunate in that a lender previously volunteered to complete your HUD/FHA approval. However, as the process is now more elaborate in comparison to when your association was originally approved, many lenders are backing away from the approval process and designating the Board of Directors as the sole agent to seek approval.", size: 10
	end

	def third_question
		text "I am a Board Member and see no need for HUD/FHA approval.", size: 10, style: :italic
	end

	def third_answer
		text "Response: As a homeowner, you may have no need for HUD/FHA approval at all. But as a Board Member, you have a fiduciary responsibility to all of the unit owners in your complex. Unit owners in HOAs that are not FHA approved are told that they cannot receive cash out refinances or reverse mortgages. Because these unit owners may not sit on the Board of Directors, they do not understand that it is your determination that will decide their ability to get refinance or retirement financing that they may need. And do the math: A fifty unit complex pays $1290 for FHA approval. It increases the value of the individual unit by $10,000. So a $26 investment by a unit owner demonstrates a 38,400% return-on-investment at sale.", size: 10
	end

	def fourth_question
		text "We are worried that FHA buyers may not have enough ‘skin’ in the game to be responsible homeowners.", size: 10, style: :italic
	end

	def fourth_answer
		text "Response: Since the mortgage meltdown seven years ago, FHA condo financing was restructured to include many safeguards protecting from irresponsible lending. HOA HUD/FHA approval is only one facet of these new safeguards. Today’s FHA condominium buyer has a lower default rate than any other FHA unit financing. In addition, the default rates are consistent with Fannie Mae and Freddie Mac borrowers. In other words, FHA condo buyers are now heavily screened.  They must prove more income and demonstrate sound fiscal judgement in order to obtain an FHA loan. These are now the type of people you would want to live in your units.", size: 10
	end

	def fifth_question
		text "Why does the State insist that the Board disclose VA Status?", size: 10, style: :italic
	end

	def fifth_answer
		text "Most HOAs are VA approved when they are built. VA approval increases the pool of buyers for any individual unit, and allows Veterans or active military personnel to purchase or refinance using VA financing. The VA approval, done once, never needs to be attended to again. VA financing has become very attractive due to the lack of ongoing mortgage insurance. Moreover, most Boards are comfortable knowing that people residing in their complex are owner occupied Veterans.", size: 10
	end


	#expiration date logic
	def expiration_date_logic
		if (defined?(@insert.month_hud_expiration)).nil?
				text "Expiration Date: #{@insert.month_hud_expiration}/#{@insert.day_hud_expiration}/#{@insert.year_hud_expiration}", size: 13
			 else 
				text "Expiration Date: None", size: 13
		end
	end

	#hud id logic
	def hud_id_logic
		if (defined?(@insert.hud_id)).nil?
			text "HUD ID Number: #{@insert.hud_id}", size: 13
		else
			text "HUD ID Number: None", size: 13
		end
	end

	#va id logic
	def va_id_logic
		if "#{@insert.va_id}".downcase == "none"
			text "VA ID Number: None", size: 13
		elsif (defined?(@insert.va_id)).nil?
			text "VA ID Number: #{@insert.va_id}", size: 13
		else
			text "VA ID Number: None", size: 13
		end
	end


	#headers and footers
	def insert_condo_approvals
		text "CondoApprovalsLLC", size: 18, style: :bold #color: "0065CC"
	end

	def insert_footer
		font "Helvetica"
		text "Headquarters: 609 Deep Valley Drive, Suite 200, Rolling Hills Estates, CA 90274
", size: 10, align: :center
		text "Telephone: 310-896-2377 FAX: 310-984-6019", size: 10, align: :center
		text "www.condoprescreen.com", size: 10, align: :center
	end

end