require 'rails_helper'

feature 'User creates service' do
  scenario 'successfully' do
    sign_in
    create_company
    click_on("Prestations")
    create_service('PREST1', 'Peinture en m2', 20)
    expect(page).to have_css('#ref-service', text: 'PREST1')
  end
end