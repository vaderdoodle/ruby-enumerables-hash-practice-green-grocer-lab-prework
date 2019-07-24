def consolidate_cart(cart)
  #create a new "consolidate" cart
  new_cart = {}
  #iterate through cart and convert to hash
  cart.each do |hash|
    hash.each do |name,describe|#name: AVOCADO, KALE. #describe: price, clearance
      if new_cart[name] #if the new_cart already has a name and count
        new_cart[name][:count] += 1 #increase the count by 1
      else #if cart is empty / does not contain item
        new_cart[name]=describe #set name as key and describe as value
        new_cart[name][:count] = 1 #create and set count value to 1 (first item occurance)
      end
    end
  end
  new_cart #return the new_cart 
end

def apply_coupons(cart, coupons)
  #doesn't break if there is no coupon
  return cart if coupons == []

  #set new_cart = cart so we don't have to push all the values, just change them
  new_cart = cart

  coupons.each do |coupon|
    name = coupon[:item] #avocado, cheese,...
    num_of_c = coupon[:num]
    #if the cart has the same item in coupon and has larger amount than in coupon
    if cart.include?(name) && cart[name][:count] >= num_of_c
       #remove number of the new_cart's count
       new_cart[name][:count] -= num_of_c
       #increase the count when there is more items than the coupon allows
       if new_cart["#{name} W/COUPON"]
         new_cart["#{name} W/COUPON"][:count] += 1
       #set the name with coupon with new value
       else
         new_cart["#{name} W/COUPON"] = {
           :price => coupon[:cost],
           :clearance => new_cart[name][:clearance],
           :count => 1
         }
       end
     end
   end
   new_cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
