# Preview epub and CBZ/CBR

Be sure to have calibre installed (use the `ebook-meta` command).

Clone this repo into `~/.config/yazi/plugins/epub-preview.yazi`, then add into `yazi.toml`:
```toml
[plugin]
prepend_previewers = [
	{ name = "*.cbz",                    run = "epub-preview" },
	{ name = "*.cbr",                    run = "epub-preview" },
	{ mime = "application/epub+zip",     run = "epub-preview" },
]
```
