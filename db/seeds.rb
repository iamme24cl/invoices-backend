# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
account = Account.create(
    accountname: "Cool Lama & Co.",
    email: "cool@mail.com",
    address: "1578 Miranda Ave, San Diego, CA, 95467", 
    password: "testing"
  )

invoice_data = [
  {
    payment_due: "2021-08-19",
    description: "Re-branding",
    payment_terms: 15,
    status: "pending",
    client_name: "Jensen Huang",
    client_email: "jensenh@mail.com",
    client_address: "106 Kendell Street, Sharrington, WA, 44261"
  },
  {
    payment_due: "2021-09-20",
    description: "Graphic Design",
    payment_terms: 30,
    status: "pending",
    client_name: "Alex Grim",
    client_email: "alexfrim@mail.com",
    client_address: "19 Union Terrace, Napa, CA, 94855"
  },
  { 
    payment_due: "2021-10-01",
    description: "Website Redesign",
    payment_terms: 15,
    status: "paid",
    client_name: "Jim Morrison",
    client_email: "jm@mail.com",
    client_address: "79 Dover Rd, WestHall, NY, 75412"
  },
  { 
    payment_due: "2021-10-11",
    description: "Logo Concept",
    payment_terms: 1,
    status: "pending",
    client_name: "Alysa Werner",
    client_email: "alysa@mail.com",
    client_address: "63 Wareick Rd, Home Town, TX, 55849"
  },
  { 
    payment_due: "2021-10-14",
    description: "Re-branding",
    payment_terms: 15,
    status: "pending",
    client_name: "Melissa Clarke",
    client_email: "melissa.clark@mail.com",
    client_address: "14 Abbey Row, Pasadena, CA, 94455"
  },
  { 
    payment_due: "2021-11-12",
    description: "Logo Re-design",
    payment_terms: 15,
    status: "draft",
    client_name: "Anita Wainwright",
    client_email: "anita.wayne@mail.com",
    client_address: "1156 Heinz Lane, Napa Valley, CA, 94452"
  }
]

items = [
  [
    {
      name: "Brand Guidelines",
      price: 1800.00,
      quantity: 1
    },
    {
      name: "New Logo",
      price: 1532.33,
      quantity: 1
    },
    {
      name: "Social Medial Consulting",
      price: 2500.00,
      quantity: 1
    }
  ],
  [
    {
      name: "Banner Design",
      price: 156.00,
      quantity: 1
    },
    {
      name: "Email Design",
      price: 200.00,
      quantity: 2
    }
  ],
  [
    {
      name: "Webiste Redisgn",
      price: 14002.33,
      quantity: 1
    }
  ],
  [
    {
      name: "Logo Sketches",
      price: 102.04,
      quantity: 1
    }
  ],
  [
    {
      name: "New Logo",
      price: 1532.33,
      quantity: 1
    },
    {
      name: "Brand Guidelines",
      price: 2500.00,
      quantity: 1
    }
  ],
  [
    {
      name: "Logo Sketches",
      price: 102.04,
      quantity: 1
    }
  ]
]

invoice_data.each do |data|
  invoice = account.invoices.build(data)
  invoice.set_random_code
  invoice.save
end

idx = 0
account.invoices.each do |invoice|
  invoice.items.build(items[idx])
  idx = idx + 1
  invoice.save
end


account.save