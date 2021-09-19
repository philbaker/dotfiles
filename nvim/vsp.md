# Vim-sexp mappings

# Movement

- `(` and `)` **move to the nearest paired structural bracket**; `(` will take you backwards to the nearest `(`, `{`, or `[`
- `W` and `B` **move forwards/backwards element-wise within a form, ending on element heads**: that is, if you're on `a` in the outer form of `(a (b c) d)`, you'll jump from `a` to `(` to `d` when pressing `WW`, versus `ww` which takes you `a` => `(` => `b`
- `E` and `gE` **move forwards/backwords element-wise**, ending on tails: `EE` on `(a (b c) d)` takes you `a` => `)` => `d`
- `[[` and `]]` **move forwards/backwards between top-level elements**: `[[` on `2` in `(1 (a b)) (d (c d) 2)` will move you to the opening paren of `1`
- `[e` and `]e` **selects adjacent elements fowards/backwards**
- `<I` and `>I` **insert at the head/tail of a form**

# Text objects

These are best used with the `i` (inside) and `a` (around) movements.

- `f` refers to the **form under the cursor**; `if` when the cursor is on `c` of `(a (b c) d)` selects `b c`
- `F` refers to the **top-level form around the cursor**; `iF` on `c` of `(a (b c) d)` selects `a (b c) d`
- `s` refers to **strings**
- `e` refers to **elements**; in a word this means the word, on a parenthese this means the form
- `w` refers to **words, which are non-form elements**; e.x. you cannot `vif` from a parenthese

# Lispy actions

## Indenting

- `==` indents the **current form**
- `=-` indents the **top level form**

## Wrapping

- `<LocalLeader>i` and `<LocalLeader>I` **surround the current form** with `()` and places the cursor at the front (`i`) or end (`I`)
- `<LocalLeader>[` and `<LocalLeader>]` do the same things for `[]`
- `<LocalLeader>{` and `<LocalLeader>}` do it for `{}`
- `<LocalLeader>w` and `<LocalLeader>W` **surround the current element** with `()` and place the cursor at the front/end
- `<LocalLeader>e[`, `<LocalLeader>e]`, `<LocalLeader>e{`, `<LocalLeader>e}` behave as above element-wise

## Splicing

- `<LocalLeader>@` **splices the current form into its parent**: `(1 (2 3) 4)` => `(1 2 3 4)`
- `<LocalLeader>o` **replaces the parent form with the current form**: ` o` in the middle of `(1 (2 3) 4)` => `(2 3)`
- `<LocalLeader>O` **replaces the parent form with the current element**: ` O` on `2` in `(1 (2 3) 4)` => `(1 2 4)`
- `>f` and `<f` swap or **move the current form right/left** (in the direction of the arrow): `>f` on `2` of `(1 (2 3) 4)` => `(1 4 (2 3))`
- `>e` and `<e` **move the current element right/left**
- `>)` and `<(` **slurp right/left**; think of them like arrows moving the corresponding parentheses a direction: `>)` in the inner form of `(1 (2 3) 4)` => `(1 (2 3 4))`
- `<)` and `>(` **burp right/left**; again, the arrows are moving the parentheses: `<)` in the inner form of `(1 (2 3) 4)` => `(1 (2) 3 4)`

Credit: https://gist.github.com/cszentkiralyi/a9a4e78dc746e29e0cc8
