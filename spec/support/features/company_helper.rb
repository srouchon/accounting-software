module Features
  def create_company
    create_company_as('Entreprise1', 'Cours Portal', 33000, 'Bordeaux', '0505050505', 'entreprise1@test.com', '11111111111', 20)
  end
  
  def create_company_as(name, address, postcode, city, phone, email, siret, tva)
    click_on('Créer une nouvelle entreprise')
    fill_in("Dénomination sociale",	with: name)
    fill_in("Adresse",	with: address)
    fill_in("Code postal",	with: postcode)
    fill_in("Ville",	with: city)
    fill_in("Téléphone",	with: phone)
    fill_in("Email",	with: email)
    fill_in("SIRET",	with: siret)
    fill_in("Taux de TVA (si vous n'êtes pas assujetti à la TVA, saisir le montant '0')",	with: tva)
    click_on('Créer cette entreprise')
  end
end