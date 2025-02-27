class Waiter

  attr_accessor :name, :yrs_experience

  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select{ |meal| meal.waiter == self }
  end

  def best_tipper
    largest_tip = 0
    highest_tipper = nil

    self.meals.each do |meal|
      if meal.tip > largest_tip
        largest_tip = meal.tip
        highest_tipper = meal.customer
      end
    end

    highest_tipper
  end



end 











# class Waiter
#
#   attr_accessor :name, :yrs_experience
#
#   @@all = []
#
#   def initialize(name, yrs_experience)
#     @name = name
#     @yrs_experience = yrs_experience
#     @@all << self
#   end
#
#   def self.all
#     @@all
#   end
#
#   def meals
#     Meal.all.select do |meal|
#       meal.waiter == self
#     end
#   end
#
#   def new_meal(customer, total, tip)
#     Meal.new(self, customer, total, tip)
#
#   end
#
#
#   def best_tipper
#     best_tipped_meal = meals.max do |meal_a, meal_b|
#       meal_a.tip <=> meal_b.tip
#     end
#
#     best_tipped_meal.customer
#   end
#
# end
