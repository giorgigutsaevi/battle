
feature "Testing infrastructure" do
	scenario "checking homepage" do
		visit("/")
		expect(page).to have_content "Testing infrastructure working!"
	end
end