#####################################################################################################################

class Contact
  	attr_reader :id
	attr_accessor :first_name, :last_name, :email, :notes
	@@contacts = []
  	@@id = 1000


  	def self.modify_using_id(id) # .................................................................................+
  		self.display_using_id(id)

  		valid_id = false
  		@@contacts.each do |the_contact|
			if the_contact.id == id 
				valid_id = true
				
				print "Change First Name? (Y/N) "
				option_selected = gets.chomp
				if option_selected == "Y"
				print "--> Enter First Name: "
				new_first_name = gets.chomp
					the_contact.first_name = new_first_name
				end 

				print "Change Last Name? (Y/N) "
				option_selected = gets.chomp
				if option_selected == "Y"
				print "--> Enter Last Name: "
				new_last_name = gets.chomp
					the_contact.last_name = new_last_name
				end 

				print "Change Email? (Y/N) "
				option_selected = gets.chomp
				if option_selected == "Y"
				print "--> Enter Email: "
				new_email = gets.chomp
					the_contact.email = new_email
				end 

				print "Change Notes? (Y/N) "
				option_selected = gets.chomp
				if option_selected == "Y"
				print "--> Enter Notes: "
				new_notes = gets.chomp
					the_contact.notes = new_notes
				end 


			else
				#puts "Not found"
			end
		end

		puts "ID: #{id} not found in database!" if valid_id == false
		puts "\n Press Enter to continue"
		gets.chomp
  	end #.............................................................................................................-

  	def self.display_using_id(id) # .................................................................................+
  		#puts "Entering display_using_id"

  		valid_id = false
  		@@contacts.each do |the_contact|
			if the_contact.id == id 
				valid_id = true

				Contact.display_datatable_header

		  		print "[%-05s]" % the_contact.id, " "
		  		print "[%-15s]" % the_contact.first_name , " "
		  		print "[%-15s]" % the_contact.last_name , " "
		  		print "[%-30s]" % the_contact.email , " "
		  		print "[%-50s]" % the_contact.notes
		  		print "\n"
			else
				#puts "Not found"
			end
		end

		puts "ID: #{id} not found in database!" if valid_id == false
		puts "\n Press Enter to continue"
		gets.chomp
  	end #.............................................................................................................-

  	def self.display_datatable_header #...............................................................................+

  		print "[%-05s]" % "ID" , " "
		print "[%-15s]" % "FIRST NAME" , " "
  		print "[%-15s]" % "LAST NAME" , " "
  		print "[%-30s]" % "EMAIL" , " "
  		print "[%-50s]" % "NOTES "
  		print "\n" 

  		print "[%-05s]" % "-----", " "
  		print "[%-15s]" % "---------------" , " "
  		print "[%-15s]" % "---------------" , " "
  		print "[%-30s]" % "------------------------------" , " "
  		print "[%-50s]" % "--------------------------------------------------"
  		print "\n" 
  	end #.............................................................................................................-

	def self.delete_using_id(id) # .................................................................................+
		#puts "Entering display_using_id"

  		valid_id = false
  		@@contacts.each do |the_contact|
			if the_contact.id == id 

				valid_id = true 
				Contact.display_datatable_header

				print "[%-05s]" % the_contact.id, " "
		  		print "[%-15s]" % the_contact.first_name , " "
		  		print "[%-15s]" % the_contact.last_name , " "
		  		print "[%-30s]" % the_contact.email , " "
		  		print "[%-50s]" % the_contact.notes
		  		print "\n"

		  		print "Enter Y to confirm delete, N to cancel the delete. "
		  		option_selected = gets.chomp

		  		if option_selected == "Y" 
		  			@@contacts.delete(the_contact)
		  			puts "\n  Requested contact has been deleted!"
		  		else
		  			puts "\n  Requested contact has NOT been deleted!"
		  		end
			else
				#puts "Not found"
			end
		end

		puts "ID: #{id} not found in database! Cannot Delete !" if valid_id == false
		puts "\n Press Enter to continue"
		gets.chomp
  	end #.............................................................................................................-

  	def self.all #...........................................................................................+
  		@@contacts
  	end #.............................................................................................................-


  	def self.create(first_name, last_name, email, note) #...........................................................+
    	new_contact = Contact.new(first_name, last_name, email, note)
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


