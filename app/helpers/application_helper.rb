module ApplicationHelper
  def page_title(*title_parts)
    title = [title_parts, 'Pollster'].flatten.compact.join(' - ')
    content_for(:title, flush: true) { title }
  end
end
