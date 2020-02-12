$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

# Returns hash { directorOne => allTheMoneyTheyMade, ... }
def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

# Gives the total gross for a director, passes nds[director_index] as argument.
def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  list = []
  director_index = 0

  while director_index < source.length do
    list[director_index] = source[director_index][:name]
    director_index += 1
  end

  list
end

#uses directors_totals and list_of_directors
def total_gross(source)
  total = 0
  i = 0

  while i < list_of_directors(source).count do
    total += directors_totals(source)[list_of_directors(source)[i]]
    i += 1
  end

  total
end

# Write this implementation
#
# Should use methods:
# 1. directors_totals: returns a Hash of { dir_name => gross }
# 2. list_of_directors: names provides an Array of directors names
#
# Visit each key (i.e. director name), look up the value in the hash
# returned by directors_totals, and add it to a running total. When done,
# return the total
