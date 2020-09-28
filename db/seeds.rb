puts 'Clean DB'
User.destroy_all
Company.destroy_all
Customer.destroy_all

puts 'Create some users'
user1 = User.create!(email: 'sophie@test.com', password: 'sophie', firstname: 'Sophie', lastname: 'Rouchon', admin: true)
user2 = User.create!(email: 'baptiste@test.com', password: 'baptiste', firstname: 'Baptiste', lastname: 'Dupont', admin: false)

puts 'Create some compamies'
company1 = Company.create!(name: 'Entreprise1', address: 'Cours Portal', postcode: 33000, city: 'Bordeaux', phone: '0505050505', email: 'entreprise1@test.com', siret: '11111111111')
company2 = Company.create!(name: 'Entreprise2', address: 'Cours Saint Louis', postcode: 33000, city: 'Bordeaux', phone: '0505050505', email: 'entreprise2@test.com', siret: '12111111113')

puts 'Create some customers'
client1 = Customer.new(ref_client: 'CL001', name: 'Client1', address: 'Place des Quinconces', postcode: 33000, city: 'Bordeaux', phone_1: '0505050505', email_1: 'client1@test.com', phone_2: '0505050505', email_2: 'client1@test.com', siren: '113411', siret: '11341111111')
client1.company = company1
client1.save!
client2 = Customer.new(ref_client: 'CL002', name: 'Client2', address: 'Place de la Victoire', postcode: 33000, city: 'Bordeaux', phone_1: '0505050505', email_1: 'client2@test.com', phone_2: '0505050505', email_2: 'client2@test.com', siren: '113451', siret: '113411555111')
client2.company = company1
client2.save!

puts 'Connect users to companies'
usercompany1 = UserCompany.new
usercompany1.user = user1
usercompany1.company = company1
usercompany1.save!
usercompany2 = UserCompany.new
usercompany2.user = user2
usercompany2.company = company1
usercompany2.save!

puts 'Finished'