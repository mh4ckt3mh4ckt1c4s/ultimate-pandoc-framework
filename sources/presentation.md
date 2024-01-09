# Importance of dealing with pandoc correctly

## The bases

Still some **bold**, some *italic*, and some ~~strikethrough~~.

==highligts== are also possible with the corresponding option.

```rs {attr.source='.numberLines'}
fn main() {
    println!("Hello, Rust !");
}
```

    def main():
        print("Hello Python")

------

I can create new slides with `---` and stay in the same part

## A new part

The header number defined in the config will also create new slides

### This is a box 

Under this number, parts will create boxes

# A new section

## Colored boxes

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

- This is 
- incremental

:::

. . .

::: nonincremental

- This is not 
- incremental at all

:::

## Yet another part

### Create columns

How to create columns : 

:::::::::::::: {.columns  align=top .onlytextwidth}
::: {.column width="40%"}
content first column
:::
::: {.column width="60%"}
content second column
:::
::::::::::::::

## Automatic splitting {.fragile .allowframebreaks}

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

## Adding images

Add images like this (they can be stored in the `media` folder). Skipping the `.png` file extension will work if it is configured correctly in the configuration files.

![](book.png){ width=250px }

![](book){ width=20% }
