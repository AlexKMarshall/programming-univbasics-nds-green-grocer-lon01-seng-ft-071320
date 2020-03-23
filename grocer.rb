def find_item_by_name_in_collection(name, collection)
  collection.count.times do |index|
    return collection[index] if collection[index][:item] === name
  end
  nil
end

def consolidate_cart(cart)
  consolidated = []
  
  cart.count.times do |index|
    new_item = cart[index]
    item_in_cart = find_item_by_name_in_collection(new_item[:item], consolidated)
    if item_in_cart
      item_in_cart[:count] += 1
    else
      new_item[:count] = 1
      consolidated << new_item
    end
  end
  consolidated
end

def create_couponed_item(coupon, item)
  {
    item: "#{item[:item]} W/COUPON",
    price: coupon[:cost] / coupon[:num],
    clearance: item_in_cart[:clearance],
    count: coupon[:num]
  }
end

def apply_coupons(cart, coupons)
  coupons.count.times do |index|
    coupon = coupons[index]
    item_in_cart = find_item_by_name_in_collection(coupon[:item], cart)
    cart << create_couponed_item(coupon, item_in_cart)
    item_in_cart[:count] -= coupon[:num]
  end
  cart
end

def apply_clearance(cart)
  # Consult README for inputs and outputs
  #
  # REMEMBER: This method **should** update cart
end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance
  #
  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
end
