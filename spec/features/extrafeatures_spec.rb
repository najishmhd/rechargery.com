require 'spec_helper'

feature "Menu bar" do
	context "Not Logged In" do
		scenario "view homepage when not logged in" do
			visit "/"
			within(".home-navigation") do
				expect(page).to have_content("Login")
				expect(page).to have_content("Sign up")
			end
		end

		scenario "view howitworks when not logged in" do
			visit "/"
			click_link "How it works"
			within(".home-navigation") do
				expect(page).to have_content("Login")
				expect(page).to have_content("Sign up")
			end
		end
	end

	context "Logged in" do
		before do
			@user = FactoryGirl.create(:user, password: "abcd")
			sign_in_with(@user.email, "abcd")
		end

		scenario "view homepage when logged in" do
			visit "/"
			within(".home-navigation") do
				expect(page).to have_content("Dashboard")
				expect(page).to_not have_content("Sign up")
			end
		end

		scenario "view howitworks when logged in" do
			visit "/"
			click_link "How it works"
			within(".home-navigation") do
				expect(page).to have_content("Dashboard")
				expect(page).to_not have_content("Sign up")
			end
		end
	end
end
