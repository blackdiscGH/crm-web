<h1> Edit Contact </h1>

<form action ="/contacts/<%= @contact.id %>" method = "post">
	<input type="hidden" name="_method" value ="put">
	<input type="text" name="first_name" value="<%= @contact.first_name%>">
	<input type="text" name="last_name" value="<%= @contact.last_name%>">
	<input type="text" name="email" value="<%= @contact.email%>">
	<input type="text" name="notes" value="<%= @contact.notes%>">
	<input type="submit" name="Submit">

</form>		