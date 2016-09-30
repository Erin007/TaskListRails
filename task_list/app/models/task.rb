class Task < ActiveRecord::Base

  def format_datetime
    @updated_at.strftime("%m/%d/%Y %H:%M")
  end

end
