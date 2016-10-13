class PurchasesController < ApplicationController
  # before_action :set_purchase, only: [:show, :edit, :update, :destroy]

  def create
    @purchase = Purchase.new(purchase_params)

    @item = Item.find(params[:purchase][:item_id])
    @slot = Slot.find(params[:purchase][:slot_id])

    @customer = Customer.where(email: params[:stripeEmail]).first_or_create
    @purchase.customer = @customer

    if @purchase.save
      if @purchase.charge(params[:stripeToken])

        Carousel.dispense(@slot.column, @slot.row)

        redirect_to action: "success", slot: "#{@slot.column}#{@slot.row}"
      else
        redirect_to @purchase.slot, notice: "Purchase charge failed"
      end
    else
      redirect_to @purchase.slot, notice: "Purchase could not be saved"
    end

  end

  def success
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def purchase_params
    params.require(:purchase).permit(:item_id, :slot_id)
  end
end
