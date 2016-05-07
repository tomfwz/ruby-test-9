puts "==== Create Brands ===="

Brand.destroy_all

Brand.create!([
  { name: 'New Balance' },
  { name: 'Nike' },
  { name: 'Adidas' },
  { name: 'Puma' },
  { name: 'Fila' },
  { name: 'ASICS' }
])

puts "==== End ===="