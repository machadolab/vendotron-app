class SlotsController < ApplicationController
  before_action :set_slot, only: [:show, :edit, :update, :destroy]

  def index
    @slots = Slot.all
  end

  def show
    @purchase = Purchase.new(slot: @slot, item: @slot.item)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_slot
    @slot = Slot.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def slot_params
    params.require(:slot).permit(:column, :row)
  end

end
