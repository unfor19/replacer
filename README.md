# replacer

[![testing](https://github.com/unfor19/replacer/workflows/testing/badge.svg)](<(https://github.com/unfor19/replacer/actions?query=workflow%3Atesting)>)

Find and replace multiline strings

## Requirements

All you need is [Docker](https://docs.docker.com/get-docker/)

## Getting Started

1. Insert a start tag and stop tag in the text file, for example

```html
<!-- replacer_start -->

<div>This is the text block that will be replaced</div>
<div>Let's make it work!</div>

<!-- replacer_end -->
```

2. Prepare a file with the text that you want to inject

```bash
$ echo -e '<div>This is the incoming text block</div>\n<div>It worked!</div>' > incoming.txt
```

3. Run the application

```bash
$ docker run --rm -v ${PWD}/:/app unfor19/replacer -sf /app/incoming.txt -df /app/README.md
```

4. That's it, your text has been replaced! To see more options

<!-- replacer_start_help -->

```bash
$ docker run --rm -v ${PWD}/:/app unfor19/replacer --help

Usage: bash main.sh -sf incoming.txt -df README.md

	--dst_file_path     |  -df  [Required]                 Full path to destination file
	--src_file_path     |  -sf  [replacer_null]            Full path to source file that will be injected
	--src_text          |  -st  [replacer_null]            Text of the source to inject
	--start_value       |  -sv  [<!-- replacer_start -->]  From where to start
	--end_value         |  -ev  [<!-- replacer_end -->]    Where to stop
	--create_backup     |  -cb  [true]                     Create a backup file
	--backup_file_path  |  -bp  [./]                       Full path to backup file

```

<!-- replacer_end_help -->

## Authors

Created and maintained by [Meir Gabay](https://github.com/unfor19)

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/unfor19/replacer/blob/master/LICENSE) file for details
