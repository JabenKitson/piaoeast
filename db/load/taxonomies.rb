taxonomies = [
  { :name => "Categories" },
  { :name => "Ethnicity" }
]

taxonomies.each do |taxonomy_attrs|
  Spree::Taxonomy.create!(taxonomy_attrs)
end