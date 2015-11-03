require 'sinatra'
require_relative 'contact'

get '/' do
	@crm_app_name = "My CRM"
	@time = Time.now
  	erb :index
end

get '/contacts' do
	@crm_app_name = "MY CONTACTS"
	Contact.create("Yehuda", "Katz", "yehuda@example.com", "Developer")
  	Contact.create("Mark", "Zuckerberg", "mark@facebook.com", "CEO")
  	Contact.create("Sergey", "Brin", "sergey@google.com", "Co-Founder")
  	erb :contacts
end

get '/contacts/new' do
	@crm_app_name = "MY CONTACTS"
  	erb :new
end

post '/contacts' do
  #puts params
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end
