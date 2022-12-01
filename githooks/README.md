# Githooks

This directory contains files related to pre-commit hooks.
These are scripts that are executed when attempting to make a commit.
The most common use cases of these scripts are formatting the code and preventing certain errors from being committed.
An overview of possible hooks can be found [here](https://pre-commit.com/hooks.html)
When one or more scripts exit with 1, the commit is canceled.
Some hooks (e.g. `black`, `isort`) edit the code in-place. When they fail, you can add the edited files and commit again.
Some other hooks (e.g. `flake8`, `detect-private-key`) require manual editing, as the fixes are non-trivial.

Besides pre-commit, you can also configure hooks to execute on different git events. More info can be found [here](https://git-scm.com/docs/githooks).

## Usage

The `set_up_githooks.sh` script will install the required packages and install them in a `.githooks` folder. Per default, hooks are installed in the `.git/hooks` folder. Moving them allows easier sharing to a repo, in order to keep the used git hooks consistent within a team.
The `.pre-commit-config.yaml` file lists the hooks and versions that should be installed. This file should be at the root of your project.
Configurations of more complex tools are detailed in `pyproject.toml`. For example, you can detail line length here and make different tools compatible.
One notable exception is `flake8` which does not support this configuration method. It is configured in `.flake8` instead.

These hooks will be executed on every commit, but can also be run manually with `pre-commit run`. To ignore any githooks, use the `--no-verify` flag on a git action.
