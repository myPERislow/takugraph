class NearbyPhotographerService
  def intialize(area)
    raise TypeError, "Area expected, got #{area.class}" unless area.is_a? Area
    @area = area
  end

  def execute
    photographers = [
      User.all.photographer.where(area_id: @area.id)
    ]
  end
end
