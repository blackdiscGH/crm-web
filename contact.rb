#####################################################################################################################

class Contact
  	attr_reader :id
	attr_accessor :first_name, :last_name, :email, :notes
	@@contacts = []
  	@@id = 1000

  	def self.all #...........................................................................................+
  		@@contacts
  	end #.............................................................................................................-


  	def self.create(first_name, last_name, email, notes) #...........................................................+
    	new_contact = Contact.new(first_name, last_name, email, notes)
    	puts new_contact
    	@@contacts << new_contact
    	#puts "Id: #{new_contact.id} Contact Added ! #{new_contact} " #Question why does using just @id not work here?
    	return new_contact
  	end # ...........................................................................................................

  	def initialize(first_name, last_name, email, note) #............................................................+
    	@first_name = first_name
    	@last_name = last_name
    	@email = email
    	@note = note
    	@id = @@id
  		@@id += 1
  	end #............................................................................................................-


  	def self.find(contact_id)
    	@@contacts.find { |contact| contact.id == contact_id }
  	end

  	def remove
    	@@contacts.delete_if { |contact| contact.id == self.id }
 	end

end

#######################################################################################################################


