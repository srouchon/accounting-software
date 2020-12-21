module Features
  def sign_in
    user = User.create!(email: 'example3@test.com', password: 'testpassword', firstname: 'TestFirstname', lastname: 'TestLastname')
    visit root_path
    fill_in "Email",	with: user.email
    fill_in "Mot de passe",	with: user.password 
    click_on("Se connecter")
  end
end