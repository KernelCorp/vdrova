
AdminUser.create email: 'admin@example.com', password: 'password'

root = OrdinaryCms::Page.find_or_create_by name: 'root'
root.update_attribute :root, true

text_page = OrdinaryCms::Factories::Page.create name: 'text_page'
text_page.build(name: 'Уголь').save
text_page.build(name: 'Брикеты').save
text_page.build(name: 'Дрова').save

contacts = OrdinaryCms::Page.find_or_create_by name: 'contacts'
contacts.sections.build(name: 'info')
contacts.sections.build(name: 'address')
contacts.sections.build(name: 'phone')
contacts.sections.build(name: 'email')
contacts.sections.build(name: 'web')
contacts.save