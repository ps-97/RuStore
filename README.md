# RuStore

Rstore is a json based file store written in ruby.

## Dependences
```
ruby ~> 3.1.0
```

## Installation
```bash
git clone https://github.com/ps-97/RuStore
cd RuStore
gem install bundler
bundle install
bundle exec ruby main.rb
```

## Usage

```bash
bundle exec ruby main.rb --help
Simple file based storage written in ruby
  -a, --add=<s>                 Add to storage Eg: --add key1:value1,key2:value2
  -d, --destroy=<s>             Destroy by key value pair, Eg: --destroy key1:value1
  -f, --find=<s>                Find records that have specific value, Eg: --find value1
  -s, --select=<s>              Optionaly filter keys for output generated by find, Eg: --find value1 --select key1,key2,key3
  -t, --storage-location=<s>    Storage file location (default: ./storage/store.json)
  -v, --version                 Print version and exit
  -h, --help                    Show this message
```
