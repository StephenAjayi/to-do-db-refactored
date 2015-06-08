require('rspec')
require('pg')
require('list')

DB = PG.connect(:dbname => 'to_do_test')

RSpec.configuration do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
  end
end

describe(List) do
  describe('#name') do
    it('returns the name of an instance of List') do
      test_list = List.new(:name => "Chores")
      expect(test_list.name()).to(eq("Chores"))
    end
  end
  describe('.all') do
    it('returns an array of all saved instances of list, it is empty at first') do
      expect(Task.all()).to(eq([]))
    end
  end
end
