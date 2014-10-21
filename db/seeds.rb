
AdminUser.create email: 'admin@example.com', password: 'password'

root = OrdinaryCms::Page.create name: 'root'
if root.valid?
  root.update_attribute :root, true
  root.sections.build(name: 'quot_text', content: 'Дерево – один из самых древних и экологически чистых видов топлива. Солнечная энергия накапливается в древесине, а затем дрова отдают ее в виде тепла. Дрова активно используются для отопления домов, бань, а также как экологическое топливо для каминов.')
  root.sections.build(name: 'quot_img', content: '<img src="/system/images/drova.png">')
  root.sections.build(name: 'title', content: 'По дрова')
  root.sections.build(name: 'body', content: '<p>Добро пожаловать к нам по дрова</p>')
  root.save
end


text_page = OrdinaryCms::Factories::Page.create name: 'text_page'
if text_page.valid?
  text_page.sections.build(name: 'body')
  text_page.sections.build(name: 'quot_text')
  text_page.sections.build(name: 'quot_img')
  text_page.save

  page = text_page.build(name: 'Уголь')
  page.section('quot_text').content = 'Уголь был первым из используемых человеком видов ископаемого топлива. Он позволил совершить промышленную революцию, которая в свою очередь способствовала развитию угольной промышленности, обеспечив её более современной технологией.'
  page.section('quot_img').content = '<img src="/system/images/ughol.png">'
  page.save

  page = text_page.build(name: 'Брикеты')
  page.section('quot_text').content = 'Продукт произведенный из натуральной угольной пыли, без химических добавок и склеивающих веществ с использованием инновационной технологии брикетирования.'
  page.section('quot_img').content = '<img src="/system/images/briket.png">'
  page.save

  page = text_page.build(name: 'Дрова')
  page.section('quot_text').content = 'Дерево – один из самых древних и экологически чистых видов топлива. Солнечная энергия накапливается в древесине, а затем дрова отдают ее в виде тепла. Дрова активно используются для отопления домов, бань, а также как экологическое топливо для каминов. Запах, который они дают нельзя ни с чем спутать - приятный аромат горящей древесины, еле слышное потрескивание мгновенно создают атмосферу покоя и уюта.'
  page.section('quot_img').content = '<img src="/system/images/drova.png">'
  page.save
end

contacts = OrdinaryCms::Page.create name: 'contacts'
if contacts.valid?
  contacts.sections.build(name: 'info')
  contacts.sections.build(name: 'address')
  contacts.sections.build(name: 'phone')
  contacts.sections.build(name: 'email')
  contacts.save
end
