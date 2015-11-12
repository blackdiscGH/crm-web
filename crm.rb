require 'sinatra'
require 'date'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
  include DataMapper::Resource
    
    property :id, Serial
    property :first_name, String
    property :last_name, String
    property :email, String
    property :notes, String
DataMapper.finalize
DataMapper.auto_upgrade!
end 


get '/' do   #Show the Index page -----------------------------------------------------------
	@crm_app_name = "My CRM"
	@today_date = Date.today.to_s
  	erb :index
end

get "/contacts/new" do
erb :new
end

get "/contacts/:id" do  # Get the detailes page of a contact --------------------------------
  @contact = Contact.get(params[:id].to_i)
  if @contact 
    erb :show_contact
  else
    raise Sinatra::NotFound
  end 
end

get '/contacts' do  # Display all the contacts -----------------------------------------------
	   @contacts = Contact.all
  	 erb :contacts
end

post '/contacts' do # Receiver for posting a new contact using data_mapper -------------------
  contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :notes => params[:notes]
    )
  redirect to('/contacts')
end

get "/contacts/:id/edit" do # Retreiving the contact using data mapper and passing @contact to Edit_Contact page   -----------
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end 

end

put "/contacts/:id" do # T his is to update
  @contact = Contact.get(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.notes = params[:notes]

    @contact.save

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

delete "/contacts/:id" do

    contact = Contact.get(params[:id].to_i)
    if contact
       contact.destroy
       redirect to("/contacts")
    else
       raise Sinatra::NotFound
    end 

  end

