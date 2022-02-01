# Invoices Backend
This application creates and manages Invoices for an account.

Live demo hosted on heroku [_here_](https://my-invoices.netlify.app/).

Here is the link to the [_Frontend_](https://github.com/iamme24cl/invoices-frontend). 

## Table of Contents
* [General Info](#general-information)
* [Technologies Used](#technologies-used)
* [Usage](#usage)
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
Ruby on Rails, PostgreSQL

## Usage
* Clone this backend repository to your machine  https://github.com/iamme24cl/invoices-backend
* Run `bundle` to install all gems listed in the gemfile
* Run `rails db:create && db:migrate` to create and migrate the database (If you are on a windows machine, you will need to make sure your PostgreSQL server is running. You can easily manage this in the PGAdmin desktop application.)
* Run `rails s` to run the server
* On the  [_frontend_](https://github.com/iamme24cl/invoices-frontend) folder run `npm install && npm start` to install all dependecies listed in the package.json file and start the server and run the application in the browser.

---
##### Login Page
![login page](demo-images/login-page.png)
--
##### Home Page
![home page](demo-images/home-page.png)
--
##### Filter Invoices
![search1 page](demo-images/search-1.png)
--
##### Filter Invoices
![search2 page](demo-images/search-2.png)
--
##### Invoice Form with dynamically generated and removed form fields for items
![form page](demo-images/invoice-form.png)
--
##### Invoice Page
![invoice page](demo-images/invoice.png)
--
##### Download as PDF
![pdf page](demo-images/pdf-page.png)
--
##### Print Page
![print page](demo-images/print-page.png)
--



## Contact
Created by [@iamme24cl](https://github.com/iamme24cl) - feel free to contact me!


