## System Administration Troubleshooting

---

### Broken `man -k`

`man -k`, `apropos` and `whatis` don't work. It looks like `whatis` database is
missing.

The solution is to run `makewhatis(1)`.

See also:

- `freebsd-update` and `whatis`: https://forums.freebsd.org/threads/53194/
- `/etc/periodic/`

---
