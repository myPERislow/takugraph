class PhotographerAutomaticAssignmentService
  def initialize(order)
    @order = order
    @area = @order.area
    @photographers = User.all.photographer.search_area(@area)
    # raise InvalidPhotographerAssignment unless PhotographerAutomaticAssignmentService.new(photographers, @order).execute
    # 第二段階(計二段階中) - dateによる絞り込み
    @date = @order.date
  end

  def execute
    # シンプルに回す
    # photographer_schedules_all = @photographers.map(&:schedules)
    # photographer_schedules_all.each do |photographer_schedules|
    #   photographer_schedules.each do |photographer_schedule|
    #     if (photographer_schedule.target_day == @date && photographer_schedule.status == true)
    #       @l.push(photographer_schedule)
    #     end
    #   end
    # end
    @l = PhotographerSchedule.where(target_day: @date, priority: true, user: @photographers).map(&:photographer)
    return @l
  end
end
