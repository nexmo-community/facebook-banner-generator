require 'ruby2d'
require 'color-generator'
require 'byebug'

def create_colors
  sat = rand(0.0..1)
  light = rand(0.0..1)

  generator = ColorGenerator.new saturation: sat, lightness: light
  color1 = generator.create_hex
  color2 = generator.create_hex
  color3 = generator.create_hex
  color4 = generator.create_hex

  colors = [color1, color2, color3, color4].map{|color| "##{color}"}

  colors
end

text = ARGV[0]
user_id = ARGV[1]

colors = create_colors

banner = Banner.create(
  colors: colors,
  text: text,
  user_id: user_id
)

@text = Text.new(
  banner.text,
  x: (640 / 2.0) - 150,
  y: (480 / 2.0) - 50,
  size: 50,
  color: 'white',
  z: 10
)

@image = Rectangle.new(
  x: 0, y: 0,
  width: 640, height: 480,
  color: banner.colors
)

Window.set(width: @text.width + 300)
@image.width = Window.width

t = Time.now

update do
  # Close the window after 5 seconds
  if Time.now - t > 5 then close end
end

Window.show

Window.screenshot "#{File.expand_path('../../../public', __FILE__)}/banner-#{banner.user_id}.png"