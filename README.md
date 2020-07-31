# replacer

Find and replace multiline strings

## Requirements

All you need is [Docker](https://docs.docker.com/get-docker/)

## Getting Started

1. Insert a start tag and stop tag in the text file, for example

```html
<!-- replacer_start -->

<div>This is the text block that will be replaced</div>
<div>Let's make it work!</div>

<!-- replacer_stop -->
```

1. Prepare a file with the text that you want to inject

```bash
$ echo -e '<div>This is the incoming text block</div>\n<div>It worked!</div>' > incoming.txt
```

1. Run the application

```bash
docker run --rm -it -v ${PWD}/:/app unfor19/replacer -sf /app/incoming.txt -df /app/README.md
```

1. That's it, your text has been replaced! To see more options

<!-- replacer_start_help -->

```
$ docker run --rm -it -v ${PWD}/:/app unfor19/replacer --help

Usage: bash main.sh

   --src_file_path     |  -sf  [Required]                 Full path to source file
   --dst_file_path     |  -df  [Required]                 Full path to destination file
   --start_value       |  -sv  [<!-- replacer_start -->]  From where to start
   --end_value         |  -ev  [<!-- replacer_stop -->]   Where to stop
   --create_backup     |  -cb  [true]                     Create a backup file
   --backup_file_path  |  -bp  [./]                       Full path to backup file

```

<!-- replacer_stop_help -->

## Authors

Created and maintained by [Meir Gabay](https://github.com/unfor19)

## License

This project is licensed under the MIT License - see the [LICENSE](https://github.com/unfor19/replacer/blob/master/LICENSE) file for details
