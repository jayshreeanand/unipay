class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:search]

  def search #qr scan
    if params['payid'].present?
      #search in existing contacts
      c = current_user.contacts.where(payid: params['payid']).first_or_create
      c.name = params['payid'].capitalize
      c.save!
      redirect_to contacts_path(c)
    end
  end

  def me
  end
end