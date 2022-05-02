class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:search]
  layout 'dashboard'
  def search #qr scan
    if params['payid'].present?
      #search in existing contacts
      c = current_user.contacts.where(payid: params['payid'], kind: 'user').first_or_create
      c.name = params['payid'].capitalize
      c.save!
      redirect_to "/contacts/#{c.id}"
    end
  end

  def me
  end

  def requests
  end
  
  def invoice
    if params[:request_id].present?
      request = Request.find(params[:request_id])
      sender = request.sender
      contact = current_user.contacts.where(payid: sender.payid, kind: :user).first_or_create
      contact.name = sender.payid.capitalize
      contact.save!
      redirect_to "/contacts/#{contact.id}"
    end
  end
end
