taxonomies = [
  { :name => "Categories" },
  { :name => "Ethnicity" }
]

taxonomies.each do |taxonomy_attrs|
  Spree::Taxonomy.create!(taxonomy_attrs)
end

categories = Spree::Taxonomy.find_by_name!("Categories")
taxons = []

taxons <<
  {
    :name => "Categories",
    :taxonomy => categories,
    :position => 0
  }
 

#Earings  
  products = []
  for i in 1..19 do
  product_name = "%d Earings" % [i]
  products << Spree::Product.find_by_name!(product_name) 
  end    
  taxons << 
  {
    :name => "Earings",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 1,
    :products => products
    }
  
#Scarfs 
  products = []
  for i in 1..20 do
  product_name = "%d Scarf" % [i]
  products << Spree::Product.find_by_name!(product_name) 
  end    
  taxons << 
  {
    :name => "Scarfs",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 1,
    :products => products
  }
  
#Bags 
  products = []
  for i in 1..20 do
  product_name = "%d Bag" % [i]
  products << Spree::Product.find_by_name!(product_name) 
  end    
  taxons << 
  {
    :name => "Bags",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 1,
    :products => products
  }
  
#Bracelets 
  products = []
  for i in 1..20 do
  product_name = "%d Bracelet" % [i]
  products << Spree::Product.find_by_name!(product_name) 
  end    
  taxons << 
  {
    :name => "Earings",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 1,
    :products => products
  }
  
#Necklaces 
  products = []
  for i in 1..19 do
  product_name = "%d Necklace" % [i]
  products << Spree::Product.find_by_name!(product_name) 
  end    
  taxons << 
  {
    :name => "Necklaces",
    :taxonomy => categories,
    :parent => "Categories",
    :position => 1,
    :products => products
    
  }
  
  
taxons.each do |taxon_attrs|
  if taxon_attrs[:parent]
    taxon_attrs[:parent] = Spree::Taxon.find_by_name!(taxon_attrs[:parent])
    Spree::Taxon.create!(taxon_attrs)
  end
end