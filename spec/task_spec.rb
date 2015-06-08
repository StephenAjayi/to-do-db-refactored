require('rspec')
require('pg')
require('task')

DB = PG.connect(:dbname => 'to_do_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM tasks *s;")
  end
end

describe(Task) do
  describe('#description') do
    it('returns the description of an instance of Task') do
      test_task = Task.new(:description => "Wash the car.")
      expect(test_task.description()).to(eq("Wash the car."))
    end
  end

  describe('.all') do 
    it('returns all tasks that have been saved, starts empty at first') do
      expect(Task.all()).to(eq([]))
    end
  end
end
