class ContactsController < ApplicationController

  before_action :authenticate_user!
  before_action :get_contact, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      if params[:commit]
        redirect_to contacts_path(:search => params["search"], :page => params["page"])
      else
        @contacts = current_user.contacts.search(params[:search]).page params[:page]
      end
    else
      @contacts = current_user.contacts.page params[:page]
    end
  end

  def show
  end

  def new
    @contact = current_user.contacts.new
  end

  def create
    @contact = current_user.contacts.new(contact_params)

    if @contact.save
      redirect_to_contact
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to_contact
    else
      render 'edit'
    end

  end

  def destroy
    @contact.destroy

    redirect_to contacts_path(:page => params["page"], :search => params["search"])
  end

  def layout
    current_user.layout = params["layout"]
    current_user.save

    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :phone, :email, :photo, :photo_cache, :query)
  end

  def get_contact
    @contact = current_user.contacts.find(params[:id])
  end

  def redirect_to_contact
    redirect_to contact_path(@contact, :page => params["page"], :search => params["search"])
  end

end
