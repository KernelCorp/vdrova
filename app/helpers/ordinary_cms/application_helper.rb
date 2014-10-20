module OrdinaryCms::ApplicationHelper
  def get_pages
    OrdinaryCms::Factories::Page.where(name: 'text_page').first.pages.order('position asc')
  end
end