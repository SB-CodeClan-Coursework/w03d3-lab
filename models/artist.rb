require('pg')

class artist

  attr_reader :id, :name

def initialize( details )
  @id   = details['id'].to_i if details['id']
  @name = details['name']
end



end
