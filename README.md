# `wyvox/action-no-git-diff`

Checks the repo for a git diff, and errors if there is a diff.

Usage:

```yml
steps:
  # ...
  - run: ./my-action/that-might-cause-a/diff
  - uses: wyvox/action-no-git-diff@1
```

An example command that might cause a diff would be a monorepo build, via turbo, nx, moonrepo, rollup, vite, or some other tool.

This action is to help reduce flakiness and aid in the pursuit of stability in CI.

## When things go right

## When things go wrong:
