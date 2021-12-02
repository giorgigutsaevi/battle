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
		attack
		expect(page).to have_content "Alfonso attacks Giorgi"
	end

	scenario "Player1's attack reduces Player2's health by 10" do
		sign_in_and_play
		attack
		click_button :Continue
		expect(page).to have_content 'Giorgi: 50hp'
	end

	scenario "Switching players" do
		sign_in_and_play
		attack
		click_button :Continue
		expect(page).to have_content "Giorgi's turn to attack"
	end

	scenario "Switches the player and the switched player engages in an attack" do
		sign_in_and_play
		attack
		click_button :Continue
		click_button :Submit
		click_button :Continue
		expect(page).to have_content "Alfonso: 50hp"
	end
end
