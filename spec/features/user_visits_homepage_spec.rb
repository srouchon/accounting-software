require 'rails_helper'

feature 'User visits homepage' do
  scenario 'successfully' do
    user = User.create!(email: 'example3@test.com', password: 'testpassword', firstname: 'TestFirstname', lastname: 'TestLastname')
    visit root_path
    fill_in "Email",	with: user.email
    fill_in "Mot de passe",	with: user.password 
    click_on("Se connecter")
    expect(page).to have_content('Sélectionner une entreprise')
  end
end