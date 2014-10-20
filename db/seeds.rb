
AdminUser.create email: 'admin@example.com', password: 'password'

root = OrdinaryCms::Page.create name: 'root'
if root.valid?
  root.update_attribute :root, true
end


text_page = OrdinaryCms::Factories::Page.create name: 'text_page'
if text_page.valid?
  text_page.sections.build(name: 'body')
  text_page.save
  text_page.build(name: 'Уголь').save
  text_page.build(name: 'Брикеты').save
  text_page.build(name: 'Дрова').save
end

contacts = OrdinaryCms::Page.create name: 'contacts'
if contacts.valid?
  contacts.sections.build(name: 'info')
  contacts.sections.build(name: 'address')
  contacts.sections.build(name: 'phone')
  contacts.sections.build(name: 'email')
  contacts.save
end
