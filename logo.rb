def pr x
  return '*' unless(x == 0)
  return ' ' if(x == 0)
end

def draw_byte x
  str = '' <<
        pr(x & 128) <<
        pr(x & 64) <<
        pr(x & 32) <<
        pr(x & 16) <<
        pr(x & 8) <<
        pr(x & 4) <<
        pr(x & 2) <<
        pr(x & 1)
  str
end

data = nil
File.open 'logo.bmp', 'rb' do |f|
  data = f.read
end

header = data[0..13]
dib_header = data[14..54]
magic = header[0..1]
puts magic
pixeldata_offset = header[10..13].unpack("L").first
puts "offset #{pixeldata_offset}"
width = dib_header[4..7].unpack("L").first
puts "width #{width}"
height = dib_header[8..11].unpack("L").first
puts "height #{height}"
bpp = dib_header[14..15].unpack("S").first
puts "bits per pixel #{bpp}"

# create image

x = data[pixeldata_offset..-1].unpack('C*')
puts "original data size #{x.size}"
image = ['','','','','','','','','','','','','','','','']
height.times do |y|
  12.times do
    image[y] += draw_byte(x.shift)
  end
end
(height-1).downto(0) do |idx|
  puts image[idx]
end

claire = # --------------------------------------------------------------------------------------------------
%q{


    xxxx  x    xx              x                           xxxx   x
   x xxxxx    xxx             xx                          xxxxxxxx
  xx xx        xx                                        x     xx
  xx xx        xx     xx  x   xx    x xxx    xxx             x xx      xx  x     xxx       xxx
  xx xx        xx   xxxxxx   xxx   xxx xx   x xxx            x xx    xxxxxx     x xxxx    x xxx
  xx x         xx       xx    xx  xxx  x   xx  x             x xx        xx    xx  xx    xx  xx
  xx x         xx    xx xx    xx   xx      xx x              x xx     xx xx    xx  xx    xx  xx
   xx     x    xx   xx xxx    xx   xx      xxx            xxx  xx    xx xxx    xx  xx    xx  xx
   xxxxxxx     xxx  xxx xxx   xxx  xxx     xxx  x        x xxx x     xxx xxx   xxx xx    xxx x
    xxxxx      xx    xxx x    xx   xx       xxxx        x   xxx       xxx x     xxxxx     xxx
                                                         xxx                       xx
                                                          x                     xx x
                                                                               xxxx

}.freeze # ----------------------------------------------------------------------------------------

# 0 - 91 ()

puts
puts
#puts 'here'
puts claire
split = claire.split("\n")
reverse = split.reverse
number_array = Array.new
final_array = Array.new
reverse.each do |line|
  while line.length < 96
    line += ' '
  end
  number_str  = line.gsub('x', '1').gsub(' ', '0')
  p number_str
  12.times do |idx|
    p number_str[(idx * 8)..idx*8+7]
    number_array << number_str[(idx * 8)..idx*8+7].to_i(2)
  end
  p "number_array.length = #{number_array.length}"
end

final_array = number_array.dup

image = ['','','','','','','','','','','','','','','','']
height.times do |y|
  12.times do
    image[y] += draw_byte(number_array.shift)
  end
end

(height-1).downto(0) do |idx|
  puts image[idx]
end

puts "number_array #{number_array}"

final_str = data[0..61]
final_str += final_array.pack('C*')

puts "final length = #{final_str.length}"

File.open 'claire.bmp', 'wb' do |f|
  f.write final_str
end



data = nil
File.open 'claire.bmp', 'rb' do |f|
  data = f.read
end

header = data[0..13]
dib_header = data[14..54]
magic = header[0..1]
puts magic
pixeldata_offset = header[10..13].unpack("L").first
puts "offset #{pixeldata_offset}"
width = dib_header[4..7].unpack("L").first
puts "width #{width}"
height = dib_header[8..11].unpack("L").first
puts "height #{height}"
bpp = dib_header[14..15].unpack("S").first
puts "bits per pixel #{bpp}"

# create image

x = data[pixeldata_offset..-1].unpack('C*')
puts "original data size #{x.size}"
image = ['','','','','','','','','','','','','','','','']
height.times do |y|
  12.times do
    image[y] += draw_byte(x.shift)
  end
end
(height-1).downto(0) do |idx|
  puts image[idx]
end


#
#      xxxx  x
#     x xxxxx
#    xx xx
#    xx xx
#    xx xx
#    xx x
#    xx x
#     xx     x
#     xxxxxxx
#      xxxxx
#
#
#     xx
#    xxx
#     xx
#     xx
#     xx
#     xx
#     xx
#     xx
#     xxx
#     xx
#
#
#      xx  x
#    xxxxxx
#        xx
#     xx xx
#    xx xxx
#    xxx xxx
#     xxx x
#
#      x
#     xx
#
#     xx
#    xxx
#     xx
#     xx
#     xx
#     xxx
#     xx
#
#      x xxx
#     xxx xx
#    xxx  x
#     xx
#     xx
#     xxx
#     xx
#
#      xxx
#     x xxx
#    xx  x
#    xx x
#    xxx
#    xxx  x
#     xxxx
#
#       xxxx   x
#      xxxxxxxx
#     x     xx
#         x xx
#         x xx
#         x xx
#         x xx
#      xxx  xx
#     x xxx x
#    x   xxx
#    xxx
#     x
#
#      xxx
#     x xxxx
#    xx  xx
#    xx  xx
#    xx  xx
#    xxx xx
#     xxxxx
#        xx
#    xx  x
#    xxxx
#
#      xxx
#     x xxx
#    xx  xx
#    xx  xx
#    xx  xx
#    xxx x
#     xxx
#
#
#    zzzzzzzz
#

  #http://www.pentacom.jp/pentacom/bitfontmaker2/editfont.php
