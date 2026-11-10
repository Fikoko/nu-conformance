# Modules and Overlays

Draft rules for modules, `use`, `hide` and overlays. The lang guide has no chapter on these yet, so they follow the Book's [Using Modules](https://www.nushell.sh/book/modules/using_modules.html), [Creating Modules](https://www.nushell.sh/book/modules/creating_modules.html) and [Overlays](https://www.nushell.sh/book/overlays.html) pages.

**Checked against:** Nushell 0.117.0.

Most tests define their modules inline with `module`. Tests that need module files keep them in a folder next to the test (see [CONTRIBUTING.md](../CONTRIBUTING.md)). Paragraphs marked **Open question** describe current behavior that may not be intended, and the questions are listed in [`open-questions.md`](../open-questions.md).

**Defined.** `module name { ... }` defines a module. The definitions in it marked with `export` can be imported with `use`. Defining a module imports nothing. `[modules.intro]`

## Defining modules

**Defined.** A module can export commands (`export def`), aliases (`export alias`), constants (`export const`) and submodules (`export module`). A definition without `export` is private: commands in the module can use it, but it can't be imported. `[modules.define.exports]`

**Defined.** An exported command named `main` is imported under the module's own name, so `use greet` makes `greet` call `main` and `greet loud` call `loud`. `[modules.define.main]`

**Defined.** An export with the same name as its module is a parse error, `nu::parser::named_as_module`. A parser keyword as the name of an export is a parse error, `nu::parser::name_is_keyword`. `[modules.define.names]`

**Defined.** An `export-env { ... }` block runs when `use` imports the module, and its changes to `$env` stay in the caller's scope. A command exported with `def --env` can change the caller's environment too. `[modules.define.env]`

## Importing

**Defined.** `use name` imports a module's exported commands and aliases as subcommands of the module name, as in `spam foo`, and its constants as a record named after the module, as in `$spam.x`. Submodules declared with `export module` aren't imported this way. `[modules.use.whole]`

**Defined.** `use name *` imports all exports directly: commands by their own names, constants as variables and submodules as commands with subcommands. `[modules.use.all]`

**Defined.** `use name f` imports only the export `f`, and `use name [f g]` imports several. A name the module doesn't export is a parse error, `nu::parser::export_not_found`. Importing the same name twice is allowed. `[modules.use.names]`

**Defined.** A spread after the module name, as in `use m ...$names`, is accepted but imports nothing, whether the list is a `let` or a `const`. A spread in place of the module name is a parse error, `nu::parser::missing_positional`. `[modules.use.spread]`

**Open question:** a spread in `use` silently imports nothing. The winnow parser reports it as `nu::parser::export_not_found` instead.

**Defined.** The module must be defined before the `use` that imports it. Otherwise, or when no module or file of that name exists, it is a parse error, `nu::parser::module_not_found`. `[modules.use.missing]`

**Defined.** Imported definitions can be used from the statement after `use` (also after `;` on the same line) to the end of the block, but not before. A `use` inside a block imports only into that block. `use` can't be piped, which is a parse error, `nu::parser::unexpected_keyword`. `[modules.use.position]`

**Defined.** When a `def` and an imported command have the same name, the one whose statement comes later in the block is used. `[modules.use.shadow]`

**Defined.** `use file.nu` imports a module from a file, named after the file without `.nu`. `use dir` imports `dir/mod.nu`. A syntax error in the file is a parse error in the script that imports it, and nothing runs. `[modules.use.files]`

**Defined.** The standard library is available as modules under `std`, such as `std/math`, without any files. `[modules.use.std]`

## Hiding

**Defined.** `hide name` removes a command or an alias from the scope from that statement on. `hide` with a module name removes everything imported from it, and `hide module main` removes only the command named after the module. Hiding a name that doesn't exist is not an error. `[modules.hide.command]`

**Defined.** A `hide` inside a block, or inside the body of a command, hides the name only in that block. `[modules.hide.scope]`

*Changed in 0.117.0 by [#19415](https://github.com/nushell/nushell/pull/19415).*

## Overlays

**Defined.** `overlay use module` activates a module as an overlay, which makes its exports available directly. `overlay use module as name` gives the overlay another name, and `overlay use --prefix module` makes the exports available as subcommands of the module name. A module file can be used as an overlay too. `[modules.overlay.use]`

**Defined.** `overlay hide name` deactivates an overlay, which removes its definitions. Using it again activates it again. The default overlay, `zero`, can't be hidden, which is a parse error, `nu::parser::cant_hide_default_overlay`, and so is `overlay hide` with no name while only `zero` is active. `[modules.overlay.hide]`

**Defined.** `overlay new name` creates an empty overlay and activates it. Definitions made after it belong to it and go away when it is hidden. `[modules.overlay.new]`

**Defined.** `overlay list` lists the overlays as a table with `name` and `active` columns. At the start, it contains only `zero`. `[modules.overlay.list]`

**Defined.** The `overlay` commands can't be piped, which is a parse error, `nu::parser::unexpected_keyword`. An overlay activated inside a block is active only in that block. `[modules.overlay.position]`
