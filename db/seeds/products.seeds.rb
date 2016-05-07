after :brands do
  puts "==== Create Products ===="

  Product.destroy_all

  new_balance = Brand.find_by_name('New Balance')
  nike        = Brand.find_by_name('Nike')
  adidas      = Brand.find_by_name('Adidas')
  puma        = Brand.find_by_name('Puma')
  fila        = Brand.find_by_name('Fila')
  asics       = Brand.find_by_name('ASICS')


  Product.create!([
    { name: "New Balance Men's MX608V4 Training Shoe", price: 74.99, sku: 'MX608V4', brand: new_balance },
    { name: "Nike Free 4.0 Flyknit Sz 13 Mens Running Shoes", price: 125.00, sku: 'MX608V4', brand: nike },
    { name: "Nike Flex 2015 Rn Sz 7 Mens Running Shoes", price: 74.99, sku: 'MX608V4', brand: nike },
    { name: "Adidas Performance Men's Galactic Elite M Running Shoe", price: 62.99, sku: 'MX608V4', brand: adidas },
    { name: "Nike Free 5.0 Tr Fit 5 Synthetic Running Shoe", price: 103.99, sku: 'MX608V4', brand: nike },
    { name: "PUMA Men's Tazon 6 Cross-Training Shoe", price: 99.99, sku: 'MX608V4', brand: puma },
    { name: "Nike Free 5.0 Tr Fit 5 Print Sz 12 Womens Cross Training Shoes", price: 74.99, sku: 'MX608V4', brand: nike },
    { name: "PUMA Women's Ignite Mesh Running Shoe", price: 83.95, sku: 'MX608V4', brand: puma },
    { name: "Adidas Youths Stan Smith Leather Trainers", price: 150.00, sku: 'MX608V4', brand: adidas },
    { name: "Fila Men's Shake N Bake 3 Basketball Shoe", price: 103.98, sku: 'MX608V4', brand: fila },
    { name: "Fila Men's Shake N Bake 3 Basketball Shoe", price: 103.98, sku: 'MX608V4', brand: fila },
    { name: "ASICS Women's Gel Challenger 10 Tennis Shoe", price: 100.00, sku: 'MX608V4', brand: asics },
    { name: "Nike Men's T-Lite XI Cross Trainer", price: 110.00, sku: 'MX608V4', brand: nike },
    { name: "Nike Lunarglide 7 Sz 7.5 Mens Running Shoes", price: 125.99, sku: 'MX608V4', brand: nike },
    { name: "PUMA Women's Narita V2 Lightweight Mesh Sneaker", price: 87.75, sku: 'MX608V4', brand: nike },
    { name: "Adidas Performance CC Cross Country Fresh 2 K Running Shoe", price: 65.00, sku: 'MX608V4', brand: adidas },
    { name: "ASICS Women's Matchplay Classic Golf Shoe", price: 99.95, sku: 'MX608V4', brand: asics },
    { name: "Adidas Originals Men's Superstar Foundation Casual Sneaker", price: 125.00, sku: 'MX608V4', brand: adidas },
    { name: "Fila Men's Posterizer Basketball Shoe", price: 80.00, sku: 'MX608V4', brand: fila }    
  ])

  puts "==== End ===="
end