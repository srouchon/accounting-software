require 'rails_helper'

feature 'User creates company' do
  scenario 'successfully' do
    sign_in
    create_company('Entreprise1', 'Cours Portal', 33000, 'Bordeaux', '0505050505', 'entreprise1@test.com', '11111111111', 20)
    expect(page).to have_css('#company-name', text: 'Entreprise1')
  end
end