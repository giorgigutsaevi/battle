
# feature "Testing infrastructure" do
# 	scenario "checking homepage" do
# 		visit("/")
# 		expect(page).to have_content "Testing infrastructure working!"
# 	end
# end

feature "Testing adding player names" do
	scenario "seeing inputted names" do
		sign_in_and_play
		expect(page).to have_content "Alfonso vs. Giorgi"
	end

	scenario "Showing player health" do
		sign_in_and_play
		expect(page).to have_content "Giorgi: 60hp"
	end
end

