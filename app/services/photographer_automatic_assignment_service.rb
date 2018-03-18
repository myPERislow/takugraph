class PhotographerAutomaticAssignmentService
  def initialize(order)
    @l = []
    @order = order
    @area = @order.area
    @photographers = User.all.photographer.search_area(@area)
    # raise InvalidPhotographerAssignment unless PhotographerAutomaticAssignmentService.new(photographers, @order).execute
    # 第二段階(計二段階中) - dateによる絞り込み
    @date = @order.date
  end

  def execute
    # シンプルに回す
    photographer_schedules = @photographers.map(&:schedules)
    photographer_schedules.each do |photographer_schedule|
      photographer_schedule.each do |photographer|
        if (photographer.target_day == @date && photographer.status == true)
          @l.push(photographer)
        end
      end
    end
    return @l
  end
end
