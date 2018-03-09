class PhotographerAutomacitAssignmentService

  def initialize(order)
    @order = order
    @area = @order.area
    photographers = User.all.photographer.where(area_id: @area.id)

      # raise InvalidPhotographerAssignment unless PhotographerAutomacitAssignmentService.new(photographers, @order).execute

      # 第二段階(計二段階中) - dateによる絞り込み

    @photographers = photographers
    @date = @order.day
　end

  def execute
    # シンプルに回す
    photographer_schedules = @photographers.map { |e| e.schedules  }

    l = []
    photographer_schedules.each do |photographer_schedule|
      photographer_schedule.each do |photographer|
        if (photographer.target_day == @date && photographer.priority == true)
          l.push(photographer)
        end
      end
    end
    if l
      t = l.sample
    else
      @order.save
      OrderMailer.post_order().deliver_later
      redirect_to root_path
    end
    if t.nil?
      @order.save
      OrderMailer.post_order().deliver_later
      redirect_to root_path
    else
      @order.update(photographer_id: t.id)
      OrderMailer.photographer_post_order().deliver_later
      redirect_to root_path
    end
  end
end
