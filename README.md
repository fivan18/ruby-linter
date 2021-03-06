<p align="center">
    <img src="screenshots/logo.PNG">
</p>

# Ivancito Linter
> A simple linter tool to verify [Naming Conventions](https://rubystyle.guide/#naming-conventions) in ruby code

**Ivancito Linter** provides a simple way to verify ruby scripts using a ***config.yml*** file for the configuration


## Built With

- Ruby
- [TTY prompt component](https://github.com/piotrmurach/tty-prompt)

## Installation

### prerequisites

Be sure to run `bundle` to install [TTY prompt component](https://github.com/piotrmurach/tty-prompt):

    $ bundle

Or install it yourself as:

    $ gem install tty-prompt

### install

Get a [project's](https://github.com/fivan18/ruby-linter) local copy and place it wherever you want in your directory structure

    $ git clone https://github.com/fivan18/ruby-linter.git

Use the terminal and go inside the [project's](https://github.com/fivan18/ruby-linter) root directory and run the next command

    $ echo "export PATH=$(pwd)/bin:$PATH" >> ~/.bashrc

Run the next command

    $ source ~/.bashrc

## Usage

You can validate the next naming conventions for methods, classes, variables and symbols:

- [ascii-only characters for identifiers](https://rubystyle.guide/#english-identifiers)
- [snake case identifiers](https://rubystyle.guide/#snake-case-symbols-methods-vars)
- [camel case identifiers](https://rubystyle.guide/#camelcase-classes)

### ***config.yml*** file
The default configuration to validate the conventions is as follows:
```ruby
---
  :variables:
    - :ascii
    - :snakecase
  :methods:
    - :ascii
    - :snakecase
  :symbols:
    - :ascii
    - :snakecase
  :classes:
    - :ascii
    - :camelcase
```

You can create your own ***config.yml*** file with custome configurations and place it where you run the `ivancito` command

### `ivancito` command

To run the linter open the terminal and go to that directory where you have the `file.rb` you'd like to validate, create the ***config.yml*** and put it there if you'd like a custom configuration. Finally, run the command as follows:

    $ ivancito file.rb

### example 

Here I use ivancito linter to validate [test_script](/spec/test/test_script)

```
$ ivancito test_script 
classes
      non ascii identifiers =========> No offences
      non camelcase identifiers =========> No offences
variables
      non ascii identifiers
         заплата line 3 column 2
      non snakecase identifiers =========> No offences
methods
      non ascii identifiers =========> No offences
      non snakecase identifiers
         a_Method line 11 column 6
         anotherMethod line 15 column 6
symbols
      non ascii identifiers =========> No offences
      non snakecase identifiers
         SomeSymbol line 8 column 3
         someSymbol line 9 column 3
$
```
In case the linter detects invalid identifiers, it'll let you know the line and the column where they are placed

## Authors

👤 **Ivan Ulises Guzman Sanchez**

- Github: [@fivan18](https://github.com/fivan18)
- Twitter: [@fivanunam](https://twitter.com/fivanunam)
- Linkedin: [fivan](https://www.linkedin.com/in/fivan)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/fivan18/ruby-linter/issues).

## 📝 License

This project is [MIT](README.md) licensed.
