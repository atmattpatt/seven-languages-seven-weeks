require "./acts_as_csv_module.rb"

class CsvRow
  def initialize(csv, index)
    @csv = csv
    @index = index
  end

  def method_missing(name, *args)
    heading = name.to_s

    if @csv.headers.include?(heading)
      heading_index = @csv.headers.index(heading)

      @csv.csv_contents[@index][heading_index]

    else
      super
    end
  end
end

class RubyCsv
  def each(&block)
    csv_contents.each_index do |index|
      block.call CsvRow.new(self, index)
    end
  end
end

csv = RubyCsv.new
csv.each { |row| puts row.one }

