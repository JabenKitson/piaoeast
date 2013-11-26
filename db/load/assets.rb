
def image(name, category, type="jpg")
  images_path = Pathname.new(File.dirname(__FILE__)) + "images/" + category
  path = images_path + "#{name}.#{type}"
  return false if !File.exist?(path)
  File.open(path)
end

images = { }
for i in 1..19 do
  product_name = "%d Earings" % [i]
  product = Spree::Product.find_by_name!(product_name) 
  images[product.master] = [{:attachment => image("image%03d" % [i],"earings")}]
end

for i in 1..20 do
  product_name = "%d Bracelet" % [i]
  product = Spree::Product.find_by_name!(product_name) 
  images[product.master] = [{:attachment => image("image%03d" % [i],"bracelets")}]
end

for i in 1..19 do
  product_name = "%d Necklace" % [i]
  product = Spree::Product.find_by_name!(product_name) 
  images[product.master] = [{:attachment => image("image%03d" % [i],"necklaces")}]
end

for i in 1..20 do
  product_name = "%d Bag" % [i]
  product = Spree::Product.find_by_name!(product_name) 
  images[product.master] = [{:attachment => image("image%03d" % [i],"bags")}]
end

for i in 1..20 do
  product_name = "%d Scarf" % [i]
  product = Spree::Product.find_by_name!(product_name) 
  images[product.master] = [{:attachment => image("image%03d" % [i],"scarfs")}]
end

images.each do |variant, attachments|
  puts "Loading images for #{variant.name}"
  attachments.each do |attachment|
    variant.images.create!(attachment)
  end
end