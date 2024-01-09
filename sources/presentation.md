# Importance of dealing with pandoc correctly

## The bases

Still some **bold**, some *italic*, and some ~~strikethrough~~.

==highligts== are also possible with the corresponding option.

<!-- TODO add this doc in readme https://ctan.tetaneutral.net/macros/latex/contrib/beamer/doc/beameruserguide.pdf -->

```rs {attr.source='.numberLines'}
fn main() {
    println!("Hello, Rust !");
}
```

    def main():
        print("Hello Python")

------

<!-- TODO describe the slide-level option and point to config.yaml https://pandoc.org/MANUAL.html#structuring-the-slide-show -->

I can create new slides with `---` and stay in the same part

## A new part

New smallest available header (see pandoc doc) will also create new slides

<!-- ### This is a box 

Incredible ! -->

# A new section

## Subpart

### Example !! {.example}

This is an example

### Alert !! {.alert}

This is an alert

# Another part

## Pauses

If you want to insert pauses into your slides, you can use the `. . .` separator...

. . .

See ? It works.

## Incremental lists

By default, lists are displayed all at once, but can change this setting in `config.yaml`.

- This
- Is 
- Incremental

. . .

But you can depart from the default using this syntax :

::: incremental

- Eat spaghetti
- Drink wine

:::

. . .

::: nonincremental

- Eat spaghetti
- Drink wine

:::

## part

### Sub sub part 

How to create columns : 

:::::::::::::: {.columns  align=top .onlytextwidth}
::: {.column width="40%"}
content first column
:::
::: {.column width="60%"}
content second column
:::
::::::::::::::

## Part part

Notes on this slide

::: notes

This is my note.

- It can contain Markdown
- like this list

:::

## Part another part {.fragile .allowframebreaks}

This 

is

a

very

long

slide

maybe 

it 

can 

be

cut 

in 

half