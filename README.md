# locize download action

Download translation files from locize.
It uses the locize CLI behind the scene. For detailed documentation of the locize CLI, please [visit the documentation](https://github.com/locize/locize-cli#download-current-published-files).

## Inputs

### `project-id`

The project-id that should be used.

### `path`

**Optional** Specify the path that should be used (default: locales).

### `version`

**Optional** The version that should be targeted (default: latest).

### `format`

**Optional** File format of namespaces (default: json; [flat, xliff2, xliff12, xlf2, xlf12, android, yaml, yaml-rails, yaml-nested, csv, xlsx, po, strings, resx, fluent, tmx, laravel, properties]).

### `language`

**Optional** The language that should be targeted.

### `namespace`

**Optional** The namespace that should be targeted.

### `skip-empty`

**Optional** Skips to download empty files (default: true).

### `language-folder-prefix`

**Optional** This will be added as a local folder name prefix in front of the language.

### `path-mask`

**Optional** This will define the folder and file structure; do not add a file extension (default: {{language}}/{{namespace}}).

### `clean`

**Optional** Removes all local files by removing the whole folder (default: false).

### `unpublished`

**Optional** Downloads the current (unpublished) translations. This will generate private download costs and also needs the api-key to be passed (default: false).

### `api-key`

**Optional** The api-key that should be used.


## Example usage

```yaml
uses: locize/download@v1
with:
  project-id: ${{ secrets.LOCIZE_PROJECT_ID }}
```