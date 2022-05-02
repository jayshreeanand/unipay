class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:search]
  layout 'dashboard'
  def search #qr scan
    if params['payid'].present?
      #search in existing contacts
      c = current_user.contacts.where(payid: params['payid'], kind: 'user').first_or_create
      c.name = params['payid'].capitalize
      c.save!
      redirect_to contacts_path(c)
    end
  end

  def me
    @xrp_balance = Payment::Client.new(current_user).balance || 2000
  end
  
end
