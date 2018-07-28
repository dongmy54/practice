class SayTest < ActiveRecord::Migration[5.1]
  def change
    say "I'm a test say"

    sleep 5

    say "hello dmy" 
  end
end
