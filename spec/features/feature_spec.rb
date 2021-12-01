feature "battle game" do
	scenario "seeing inputted names" do
		sign_in_and_play
		expect(page).to have_content "Alfonso vs. Giorgi"
	end

	scenario "Showing player health" do
		sign_in_and_play
		expect(page).to have_content "Giorgi: 60hp"
	end

	scenario "Player1 attacks Player2 and gets confirmation" do
		sign_in_and_play
		choose 'attack'
		click_button :Submit
		expect(page).to have_content "Alfonso Attack Giorgi"
	end
end
