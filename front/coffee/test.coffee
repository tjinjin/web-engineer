names = ["tanaka", "sasaki", "sato"]

hello = (name) ->
  alert "Hi, #{name}"

for name in names
  hello(name) if name.length > 5
