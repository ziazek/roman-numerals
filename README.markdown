# Roman Numerals

## About

Best of Ruby Quiz, Chapter 8

Write a converter to and from Roman numerals.

The script should be a standard Unix filter, reading from files specified on the command line or STDIN and writing to STDOUT. Each line of input will contain one integer (from 1 to 3,999**) expressed as an Arabic or Roman numeral. There should be one line of output for each line of input, containing the original number in the opposite format.

For example, given the following input:

```
III
29
38
CCXCI
1999
```

The correct output is as follows:

```
3
XXIX
XXXVIII
291
MCMXCIX
```

** Roman numerals for 4,000 and up do not use plain ASCII characters.

## Requirements

Ruby 2.2.2

## Notes

- next up: DRY up the code.

## Usage

run `bundle install`
`$ ./roman.rb source.txt` where `source.txt` contains, on each line, one integer from 1 to 3,999^13 expressed as an Arabic or Roman numeral.

## Understanding the Question

## Results

**Source:**

```
III
29
38
CCXCI
1999
MMMCMXIX
3499
359
```

**Results:**

```
3
XXIX
XXXVIII
291
MCMXCIX
3919
MMMCDXCIX
CCCLIX
```

## Review

## License

This code is released under the [MIT License](http://www.opensource.org/licenses/MIT)


