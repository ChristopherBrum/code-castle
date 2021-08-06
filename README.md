# Code Castle

## To-do

- Ginni - find images and populate images/ folder (start outline of orchestration engine?)
- Hunter - populate csv files with question content, work on to_s
- Chris - write out content for all "junctures" in gameplay
- Pierre - push questions to main branch to complete question content
- [ ] Generate 25 questions each:
  - [ ] Ginni - pointers, mutation, object passing
  - [x] Hunter - return values, truthiness, ruby methods
  - [ ] Pierre - Ruby Collections 1-4, Ruby Collections Methods: each select map + enumerable
  - [x] Christopher - iterations, selection, transformation, nested data structures, Methods: sorting and comparison

## Progress Meeting Notes

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
