# pre-commit-dotnet-format
A plugin to support [`dotnet-format`](https://github.com/dotnet/format) in
[`pre-commit`](https://github.com/pre-commit/pre-commit). This plugin relies on [`docker`](https://www.docker.com) being
installed.

## DEPRECATED
Support for pre-commit has been [merged into
`dotnet-format`](https://github.com/dotnet/format/blob/main/docs/integrations.md#pre-commitcom-hook-to-reformat). Use
that.

## Using dotnet-format with pre-commit:
Add this to your `.pre-commit-config.yaml`

```
-   repo: https://github.com/jvstein/pre-commit-dotnet-format
    rev: 'v0.3'
    hooks:
    -   id: dotnet-format
```

By default, dotnet-format will look for a `.sln` or other project file in the root folder. To specify a particular
solution file, pass it in with the `--workspace` argument.

```
-   repo: https://github.com/jvstein/pre-commit-dotnet-format
    rev: 'v0.3'
    hooks:
    -   id: dotnet-format
        args: ['subfolder/project.sln']
```

If you have multiple solution or project files in your repo, you may specify multiple hook configurations.

```
-   repo: https://github.com/jvstein/pre-commit-dotnet-format
    rev: 'v0.3'
    hooks:
    -   id: dotnet-format
        name: dotnet-format-proj1
        files: 'subfolder1/.*'
        args: ['subfolder1/project.csproj']
    -   id: dotnet-format
        name: dotnet-format-proj2
        files: 'subfolder2/.*'
        args: ['subfolder2/project.sln']
```

Alternatively, specify a root folder for all code with the `--folder` argument.

```
-   repo: https://github.com/jvstein/pre-commit-dotnet-format
    rev: 'v0.3'
    hooks:
    -   id: dotnet-format
        args: ['.', '--folder']
```

It's possible to exclude files from the run using `--exclude`. Be sure to follow your exclude list with `--`.

```
-   repo: https://github.com/jvstein/pre-commit-dotnet-format
    rev: 'v0.3'
    hooks:
    -   id: dotnet-format
        args: ['--exclude', 'subfolder3/', '--']
```
