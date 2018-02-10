class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_contact, only: [:show, :edit, :update]

  def index
    @contacts = current_user.contacts
  end

  def show
  end

  def new
    @contact = current_user.contacts.new
  end

  def create
    @contact = current_user.contacts.new(contact_params)

    if @contact.save
      redirect_to @contact
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to(@contact)
    else
      render 'edit'
    end

  end

  def destroy
    @contact = current_user.contacts.find(params[:id])
    @contact.destroy

    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :photo, :photo_cache)
  end

  def set_contact
    @contact = current_user.contacts.find(params[:id])
  end
end
