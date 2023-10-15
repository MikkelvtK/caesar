defmodule CaesarTest do
  use ExUnit.Case
  doctest Caesar

  describe "encrypt/2" do
    test "should encrypt a message" do
      assert Caesar.encrypt(~c"abc", 1) === ~c"bcd"
    end

    test "should leave non alphabetic characters alone" do
      assert Caesar.encrypt(~c"a1", 1) === ~c"b1"
    end

    test "should wrap if key is too large" do
      assert Caesar.encrypt(~c"abc", 27) === ~c"bcd"
    end

    test "should handle empty strings" do
      assert Caesar.encrypt(~c"", 1) === ~c""
    end
  end
end
