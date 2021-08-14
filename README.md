# Code Castle

## To-do

- Questions:
  - add separate attributes for output and return
  - Continue csv import
  - Continue on question to_s
- Text Content:
  - Complete villain intros
  - Complete lair intros
- Images:
  - Find intro / victory / defeat / boss images
- Organize Repository:
  - Models folder: each class or module (.rb file)
  - Content folder: all content (text files, text images, questions csv)
- Group session to implement basic functionality for game orchestration engine

## Progress Meeting Notes

- [8/13/2021](./meetings/08_13_21.md)
- [8/6/2021](./meetings/08_6_21.md)

## Content Guidelines

### Example

---

```ruby
______ 'hello world'
Kernel.puts('hello world')
```

Outputs: `"hello world"` twice

Answers: `['puts', 'p', 'print' ]`

Description: Syntactical Sugar, specifically shows how Ruby does not require parenthesis after a method call.

---

```ruby
# some code here
```

Outputs: _show what code outputs and/or returns_

Answers: `[]` _include all possible answers in an array_

Description: _short sentence explaining code snippet_

---
  
### Rules

- All questions should be seperated with a line (`---`)
- Code snippet comes first, followed by Outputs/Returns, Answer, and Description
- Question prompt is pretty much the same for all questions:
  - "Given the following output, how would you complete the given code?"
- All blanks to be filled in in code snippets should denoted by `______`, 6 underscore characters in a row
- What code snippet returns / outputs should be explicitly written out underneath the relevant code snippet
  - Use backticks to show code
- Write out any potential answers to the blank in the code snippet in an array
- Description should contain short sentence explaining what the code snippet demonstrates
  - should be shown once user gets answer
