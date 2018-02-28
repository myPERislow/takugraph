class PhotographerAutomacitAssignmentService
  THRESHOLD_OD_DIFFERENCE = 8

  def initialize(photographers, order)
    raise TypeError, "Order expected, get #order.class" unless order.is_a? Order
    @photographers = photographers
    @order = order
    @date = @order.day
　end

  def execute
    return false unless @date.present?
    photographer = @photographers.select { |photographer| photographer.schedules.where(target_day: @date).priority == true}.sample
  end
end
