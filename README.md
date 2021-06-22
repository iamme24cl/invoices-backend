# Invoices Backend
> This application creates and manages Invoices for an account.

> Live demo [_here_](https://www.loom.com/share/5e6c1d5a44764bf68c366c3db1350c6e). 

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Usage](#usage)
* [Project Status](#project-status)
* [Contact](#contact)


## General Information
- Create, update and delete invoices.
- Easily manage invoicing your Clients
- The following json response is expected from this api
```
invoice_data = [
  {
    payment_due: "2021-08-19",
    description: "Re-branding",
    payment_terms: 15,
    status: "pending",
    client_name: "Jensen Huang",
    client_email: "jensenh@mail.com",
    client_address: "106 Kendell Street, Sharrington, NR24 5WQ, United Kingdom"
  },
  {
    payment_due: "2021-09-20",
    description: "Graphic Design",
    payment_terms: 30,
    status: "pending",
    client_name: "Alex Grim",
    client_email: "alexfrim@mail.com",
    client_address: "19 Union Terrace, London, E1 3EZ, United Kingdom"
  },
  { 
    payment_due: "2021-10-01",
    description: "Website Redesign",
    payment_terms: 15,
    status: "paid",
    client_name: "Jim Morrison",
    client_email: "jm@mail.com",
    client_address: "79 Dover Rd, WestHall, 95578, United States of America"
  }
 ]
```

## Technologies Used
Ruby on Rails

## Usage
* Clone this backend repository to your machine  https://github.com/iamme24cl/invoices-backend
* Run `bundle` to install all gems listed in the gemfile
* Run `rails db:create && db:migrate` to create and migrate the database (If you are on a windows machine, you will need to make sure your PostgreSQL server is running. You can easily manage this in the PGAdmin desktop application.)
* Run `rails s` to run the server
* On Your front-end folder run `npm install && npm start` to install all dependecies listed in the package.json file and start the server and run the application in the browser.

## Project Status
Project is: _in progress_ . I intend to add more features to this application as I learn new skills.


## Contact
Created by [@iamme24cl](https://github.com/iamme24cl) - feel free to contact me!


