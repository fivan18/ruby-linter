# frozen_string_literal: true

class Dashboard
  LINES_TO_WIN = [[1, 2, 3],
                  [4, 5, 6],
                  [7, 8, 9],
                  [1, 4, 7],
                  [2, 5, 8],
                  [3, 6, 9],
                  [1, 5, 9],
                  [3, 5, 7]].freeze

  attr_reader :arr

  def initialize
    @arr = %w[none 1 2 3 4 5 6 7 8 9]
  end

  def there_a_place?
    arr.each do |item|
      return true if item != 'none' && item != '✘' && item != '●'
    end
    false
  end

  def there_a_winner?
    LINES_TO_WIN.each do |line|
      return true if arr[line[0]] == arr[line[1]] && arr[line[1]] == arr[line[2]]
    end
    false
  end

  def add_move(place, symbol)
    return false if place.class != String ||
                    !place.match?(/^[1-9]$/) ||
                    @arr[place.to_i] == '●' ||
                    @arr[place.to_i] == '✘'

    @arr[place.to_i] = symbol
    true
  end

  def places_available
    str = ''
    @arr.each do |item|
      str += item if /[123456789]/.match?(item)
    end

    return nil if str == ''

    str = "[#{str}]"
    Regexp.new(str)
  end
end