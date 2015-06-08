class List

  attr_reader(:name)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
  end
  define_singleton_method(:all) do
    found_lists = DB.exec("SELECT * FROM lists;")
    lists = []
    found_lists.each do |found_list|
      name = found_list.fetch("name")
      lists.push(List.new(:name => name))
    end
    lists
  end
end
