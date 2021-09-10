if Rails.env === 'production' 
  Rails.application.config.session_store :cookie_store, key: '_invoices_backend', domain: 'invoices_backend-json-api'
else
  Rails.application.config.session_store :cookie_store, key: '_invoices_backend'
end