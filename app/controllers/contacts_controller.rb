class ContactsController < ApplicationController
  def index
    if params.has_key?(:user_id)
      @user = User.find(params[:user_id])
      shared_contacts = @user.shared_contacts
      @contacts = Contact.where(user_id: params[:user_id])
      @contacts.concat(shared_contacts)
    else
      @contacts = "Cannot load all database contacts."
    end
    render json: @contacts
  end
  
  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
        json: contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end
  
  def show
    contact = Contact.find(params[:id])
    render json: contact
  end
  
  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: contact
    else
      render json: contact.errors.full_messages
    end
  end
  
  def destroy
    contact = Contact.find(params[:id])
    contact.destroy!
    render json: contact
  end
  
  def contact_params
    params[:contact].permit(:name, :email, :user_id)
  end
end
