module ApplicationHelper
  def create_time(prototype)
    prototype.created_at.to_s(:us)
  end
end
