module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Conference Attendance Management").join(" - ")
      end
    end
  end
end
