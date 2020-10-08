def select_fruit(produce_hash)
  fruit_hash = Hash.new
  counter = 0
  produce_items = produce_hash.keys

  loop do
    break if counter == produce_items.size

    current_item = produce_items[counter]
    current_type = produce_hash[current_item]

    if current_type == 'Fruit'
      fruit_hash[current_item] = current_type
    end

    counter += 1
  end

  fruit_hash
end

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}