require('rspec')
require('album')

describe('Album') do
  before() do
    Album.clear()
  end

describe("#name") do
  it("returns the name of the album") do
    test_album = Album.new("Toyota", 2000)
    expect(test_album.name()).to(eq("Toyota"))
  end
end

describe("#year") do
  it("returns the year of the album") do
    test_album = Album.new("Toyota", 2000)
    expect(test_album.year()).to(eq(2000))
  end
end

describe(".all") do
    it("is empty at first") do
      expect(Album.all()).to(eq([]))
    end
  end

 describe("#save") do
    it("adds a album to the array of saved albums") do
      test_album = Album.new("Toyota", 2000)
      test_album.save()
      expect(Album.all()).to(eq([test_album]))
    end
  end

 describe(".clear") do
    it("empties out all of the saved albums") do
      Album.new("Toyota", 2000).save()
      Album.clear()
      expect(Album.all()).to(eq([]))
    end
  end

  describe("#id") do
    it "returns the id of the album" do
      test_album = Album.new("Toyota", 2000)
      test_album.save()
      expect(test_album.id()).to(eq(1))
    end
  end

  describe('find') do
    it ('returns album based on id #') do
      test_album = Album.new('Toyota', 2000)
      test_album.save()
      test_album2 = Album.new("Corolla", 1999)
      test_album2.save()
      expect(Album.find(test_album.id())).to(eq(test_album))
    end
  end
end
