require('pry')
class Album
  @@albums = []

  define_method(:initialize) do |name, year|
    @name = name
    @year = year
    @id = @@albums.length() + 1
  end

  define_method(:name) do
    @name
  end

  define_method(:year) do
    @year
  end
  define_method(:id) do
    @id
  end

  define_singleton_method(:all) do
    @@albums
  end

  define_method(:save) do
    @@albums.push(self)
  end

  define_singleton_method(:clear) do
    @@albums = []
  end

  define_singleton_method(:find) do |ident|
    found_album = nil
    @@albums.each() do |album|
      if album.id()==ident.to_i
        found_album = album
      end
    end
    found_album
  end
end
