
# Listen for the following events on the entry template
Template.entry.events 
    # All keyup events from the #messageBox element
  'keyup #messageBox': (event) ->
    console.log("key up event!", event.which)
 
    if event.type == "keyup" && event.which == 13 # [ENTER]
      console.log("Enter key up event!", event.which)
      new_message = $("#messageBox")
      name = $("#name")

      # Save values into Mongo
      Messages.insert
        name: name.val(),
        message: new_message.val(),
        created: new Date()

      # Clear the input boxes
      new_message.val("")
      new_message.focus()

      # Make sure new chat messages are visible
      $("#chat").scrollTop 9999999;

# Load all documents in messages collection from Mongo
Template.messages.helpers 
  messages:->
    Messages.find({}, { sort: {time: -1} })

