module ApplicationHelper
  def hbr(str)
    str = html_escape(str)
    raw str.gsub(/\r\n|\r|\n/, '<br />')
  end

  def hdatetime(date)
    return if date.blank?
    date.strftime("%Y/%m/%d %H:%M")
  end

  def shallow_args(parent, child)
    child.try(:new_record?) ? [parent, child] : child
  end
end
