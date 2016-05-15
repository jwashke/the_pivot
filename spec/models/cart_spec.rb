require "rails_helper"

RSpec.describe "Cart" do

  before :each do
    @cart = Cart.new([])
  end

  describe "#add_home" do
    it "adds a home to the cart" do
      checkin = {"date(1i)"=>"2017", "date(2i)"=>"5", "date(3i)"=>"2"}
      checkout = {"date(1i)"=>"2017", "date(2i)"=>"6", "date(3i)"=>"5"}
      home = create(:home)

      @cart.add_home(home.id, checkin, checkout)
      expected_contents = [{
        "home" => home.id,
        "checkin" => checkin,
        "checkout" =>checkout
      }]
      expect(@cart.contents).to eq(expected_contents)
    end
  end

  describe "#total" do
    it "adds up the total price of all items in the cart" do
      checkin = {"date(1i)"=>"2017", "date(2i)"=>"5", "date(3i)"=>"2"}
      checkout = {"date(1i)"=>"2017", "date(2i)"=>"6", "date(3i)"=>"5"}
      home = create(:home)

      @cart.add_home(home.id, checkin, checkout)

      expect(@cart.total).to eq(3400.00)
    end
  end

  describe "#clear_contents" do
    it "empties the carts contents" do
      checkin = {"date(1i)"=>"2017", "date(2i)"=>"5", "date(3i)"=>"2"}
      checkout = {"date(1i)"=>"2017", "date(2i)"=>"6", "date(3i)"=>"5"}
      home = create(:home)

      @cart.add_home(home.id.to_s, checkin, checkout)
      @cart.clear_contents

      expect(@cart.contents).to eq(Array.new)
    end
  end

  describe "#quantity" do
    it "returns the number of items in the cart" do
      checkin = {"date(1i)"=>"2017", "date(2i)"=>"5", "date(3i)"=>"2"}
      checkout = {"date(1i)"=>"2017", "date(2i)"=>"6", "date(3i)"=>"5"}
      home = create(:home)

      @cart.add_home(home.id.to_s, checkin, checkout)

      expect(@cart.quantity).to eq(1)
    end
  end

  describe "#reservations" do
    it "wraps the cart contents in CartReservationObjects" do
      checkin = {"date(1i)"=>"2017", "date(2i)"=>"5", "date(3i)"=>"2"}
      checkout = {"date(1i)"=>"2017", "date(2i)"=>"6", "date(3i)"=>"5"}
      home = create(:home)

      @cart.add_home(home.id.to_s, checkin, checkout)
      cart_reservation = @cart.reservations.first

      expect(cart_reservation.class).to eq(CartReservation)
    end
  end
end
