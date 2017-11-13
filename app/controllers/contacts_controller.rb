class ContactsController < ApplicationController
  def index
    @contact_data = Contact.last
  end
end
