class SlotsController < ApplicationController

  def index
    render :show
  end

  def show
    @slot_column = ''
    @slot_row = ''

    unless params[:id].blank?

      @slot = Slot.find(params[:id])
      @purchase = Purchase.new(slot: @slot, item: @slot.item)

      @slot_column = @slot.column
      @slot_row = @slot.row

      if intercooler.current_target? 'slot-detail'
        render :partial => 'slot_detail'
      end
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def slot_params
    params.require(:slot).permit(:column, :row)
  end

end
