require 'sinatra'

get '/' do
	@crm_app_name = "My CRM"
	@time = Time.now
  	erb :index
end

get '/contacts' do
	@crm_app_name = "MY CONTACTS"
  	erb :contacts
end

get '/contacts/new' do
	@crm_app_name = "MY CONTACTS"
  	erb :new
end

