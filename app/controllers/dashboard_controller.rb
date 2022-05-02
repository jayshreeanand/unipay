class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def index
    @qr_code = current_user.qr_code_svg
    @qr_code_svg = @qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
  end

  def create_payid
    username = params['username'] || current_user.email.split('@')[0] || "random#{rand(1000..9000)}"
    if params['username'].present?
      begin
        if params['xrp_address'].present?
          current_user.xrp_address = params['xrp_address']
          current_user.xrp_secret = params['xrp_seed']
          response = Instapay::Client.new.create_payid(params[:username], xrp_address: params['xrp_address'])

        else
          byebug
          test_wallet = Payment::Client.new(current_user).test_wallets[1]
          current_user.xrp_address = test_wallet[:address]
          current_user.xrp_secret = test_wallet[:secret]
          response = Instapay::Client.new.create_payid(params[:username], xrp_address: current_user.xrp_address)
        end
        current_user.payid = response[:payid].split('$')[0]
        current_user.xrp_balance = 1000
        current_user.save!
        redirect_to dashboard_path, notice: "Your PayID was successfully created!"

      rescue Exception => e
        throw 'e' # show error message
      end
      
    end
  end
end
