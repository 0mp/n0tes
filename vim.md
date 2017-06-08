# Vim

## Buffers

Reload files in tabs:

```
:tabdo e!
```
---

Reload files in buffers:

```
:bufdo e
```
---


## Clipboard

Copy text to system clipboard:

```
"*y
```

---


## Files

Open many files at once:

- ```sh
  vim -p foo.txt bar.c *.h
  ```

- ```
  :n *.c
  ```

- ```
  :tab ball
  ```
---


## Syntax highlighting and color schemes

List all the currently used highlights:

```
:so $VIMRUNTIME/syntax/hitest.vim
```

or

```
:hi
```

---
