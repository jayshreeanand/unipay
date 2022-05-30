class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end


  # POST /transactions
  # POST /transactions.json
  def create
    if params['transaction']['contact'].present?
       redirect_to dashboard_path, notice: "You request for payment was successfully sent"
       return
    end
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    contact = Contact.find_by_payid(params['transaction']['payid'].split('@')[0])
    @transaction.contact = contact
    @transaction.from_currency = 'USD'
    @transaction.to_currency = 'XRP'
    exchange_rate = Cryptocompare::Price.find('USD', 'XRP')
    @transaction.to_value = exchange_rate['USD']['XRP']

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction.contact, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:user, :contact, :from_value, :from_currency, :to_value, :to_currency)
    end
end
