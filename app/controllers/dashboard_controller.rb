class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def create_payid
    if params[:username].present?
      begin
        response = Instapay::Client.new.create_payid(params[:username])
        current_user.payid = response
        current_user.save!
      rescue Exception => e
        throw 'e' # show error message
      end
      
    end
  end


end
