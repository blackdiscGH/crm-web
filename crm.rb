require 'sinatra'
require_relative 'contact'
require 'date'

Contact.create("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar")

get '/' do
	@crm_app_name = "My CRM"
	@today_date = Date.today.to_s
  	erb :index
end

get "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact 
    erb :show_contact
  else
    raise Sinatra::NotFound
  end 
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

get "/contacts/:id/edit" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end 

end

put "/contacts/:id" do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end
