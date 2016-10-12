PRODUCTS = [
  { name: "Thinkpad", price: 250 },
  { name: "Dell", price: 500 },
  { name: "Mac", price: 1000 }
]
  
query = {
  price_min: 200,
  price_max: 450,
  q: "thinkpad"
}  

def search(query)
  output_arry = []
  query.each do | cat, value |
    

end