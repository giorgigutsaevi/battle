
# feature "Testing infrastructure" do
# 	scenario "checking homepage" do
# 		visit("/")
# 		expect(page).to have_content "Testing infrastructure working!"
# 	end
# end

feature "Testing adding player names" do
	scenario "seeing inputted names" do
		visit("/")
		fill_in :player_1_name, with: "Alfonso"
		fill_in :player_2_name, with: "Giorgi"
		click_button :Submit
		save_and_open_page
		
		expect(page).to have_content "Alfonso vs. Giorgi"
	end
end

