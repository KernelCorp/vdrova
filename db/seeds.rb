
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


text_page = OrdinaryCms::Factories::Page.find_or_create_by name: 'text_page'
if text_page.new_record?
  text_page.sections.build(name: 'body')
  text_page.sections.build(name: 'quot_text')
  text_page.sections.build(name: 'quot_img')
  text_page.save

end

page = text_page.pages.where(name: 'Уголь').first || text_page.build(name: 'Уголь')
if page.new_record?
  page.section('quot_text').content = 'Уголь был первым из используемых человеком видов ископаемого топлива. Он позволил совершить промышленную революцию, которая в свою очередь способствовала развитию угольной промышленности, обеспечив её более современной технологией.'
  page.section('quot_img').content = '<img src="/system/images/ughol/ughol.png">'
  page.section('body').content ='<table><thead><tr><th>Марка</th><th>Код</th><th>Название</th><th>Теплота <br>ккал/кг</th><th>Фракция <br>мм</th></tr></thead><tbody><tr><td>Длиннопламянный</td><td>код</td><td>орех</td><td>6400 6900</td><td>25-50</td></tr></tbody></table>'
end
if page.section('price').nil?
  page.sections.build(name: 'price', content: '150 р.')
  page.sections.build(name: 'price2', content: '250 р.')
end
page.save

page = text_page.pages.where(name: 'Брикеты').first || text_page.build(name: 'Брикеты')
if page.new_record?
  page.section('quot_text').content = 'Продукт произведенный из натуральной угольной пыли, без химических добавок и склеивающих веществ с использованием инновационной технологии брикетирования.'
  page.section('quot_img').content = '<img src="/system/images/brikets/briket.png">'
  page.section('body').content ='<table><thead><tr><th>Наименование</th><th>Вес упаковки</th><th>Теплота <br>ккал/кг</th><th>Зольность <br>%</th></tr></thead><tbody><tr><td>Длиннопламянный</td><td>орех</td><td>6400 6900</td><td>25-50</td></tr></tbody></table>'
end
if page.section('price').nil?
  page.sections.build(name: 'price', content: '150 р.')
end
page.save

page = text_page.pages.where(name: 'Брикеты').first || text_page.build(name: 'Дрова')
if page.new_record?
  page.section('quot_text').content = 'Дерево – один из самых древних и экологически чистых видов топлива. Солнечная энергия накапливается в древесине, а затем дрова отдают ее в виде тепла. Дрова активно используются для отопления домов, бань, а также как экологическое топливо для каминов. Запах, который они дают нельзя ни с чем спутать - приятный аромат горящей древесины, еле слышное потрескивание мгновенно создают атмосферу покоя и уюта.'
  page.section('quot_img').content = '<img src="/system/images/drova/drova.png">'
  page.section('body').content ='<table><thead><tr><th>Дерево</th><th>Рассыпной<br>м3</th><th>1 Ящик</th><th>1 Сетка</th></tr></thead><tbody><tr><td>Длиннопламянный</td><td>орех</td><td>6400</td><td>25-50</td></tr></tbody></table>'
end
if page.section('price').nil?
  page.sections.build(name: 'price', content: '150 р.')
end
page.save


contacts = OrdinaryCms::Page.create name: 'contacts'
if contacts.valid?
  contacts.sections.build(name: 'address', content: 'Новосибирск, Бердское шоссе, 151')
  contacts.sections.build(name: 'phone', content: '+7-999-999-99-99')
  contacts.sections.build(name: 'email', content: 'drova@yandex.ru')
  contacts.save
end
