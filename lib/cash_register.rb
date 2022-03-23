
require 'pry'

class CashRegister
  attr_reader :discount, :items
  attr_accessor :total, :last_price 
  # this attribute creates a reader & writer INSTANCE METHOD for us, instead of writing each one out for total and discount
  # these INSTANCE METHODS are usable, we can call them, like in the add_item
  # we can re-write total by reading current total, plus price argument


  def initialize employee_discount = 0
    # @instance variables, set to initial default values.
    # We give them specific abilities (readable, writable, or both) with the atrribute MACROS above
    @total = 0
    @discount = employee_discount
    @items = []
    @last_price = 0
  end


  def add_item title, price, quantity=1
    @quantity = quantity
    quantity.times do
      self.items << title 
    end
    # call last_price accessor method; we've stored the last price here
    self.last_price= price * quantity
    self.total += price * quantity
    # self.total = self.total + price
    # writer=       reader   +   argument
  end


  def apply_discount
    if self.discount > 0
      # convert integar to float .to_f
      self.total= self.total - (self.discount.to_f / 100) * self.total
      # convert float back to integar .to_i
      # writer=   reader    -  (  arguments             ) *  reader
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end


  def void_last_transaction
    self.total= self.total - self.last_price
    #  writer=    reader   -  argument
  end
end