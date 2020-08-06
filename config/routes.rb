Rails.application.routes.draw do
  get '/', to: 'application#index'
  post '/webhooks/message', to: 'messenger#inbound'
  post '/webhooks/status', to: 'messenger#status'
end
