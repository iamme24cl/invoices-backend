# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
account = Account.create(accountname: "My Account", address: "19 Union Terrace, London, E1 3EZ, United Kingdom", password: "testing")

invoice_data = {
  payment_due: "2021-08-19",
  description: "Re-branding",
  payment_terms: 15,
  status: "pending",
  client_name: "Jensen Huang",
  client_email: "jensenh@mail.com",
  client_address: "106 Kendell Street, Sharrington, NR24 5WQ, United Kingdom"
}

invoice = account.invoices.build(invoice_data)

item_data =   {
  name: "Brand Guidelines",
  quantity: 1,
  price: 1800.90,
  total: 1800.90
}

invoice.items.build(item_data)

invoice.set_random_code

account.save