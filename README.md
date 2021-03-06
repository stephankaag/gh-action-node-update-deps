# gh-action-node-update-deps

Updates Node dependencies and creates a pull request with the changes.

Note: prefer dependabot over this action **once** [dependabot supports grouped pull requests](https://github.com/dependabot/feedback/issues/5).

## Example usage

```yaml
name: Scheduled dependencies update
on:
  schedule:
    - cron:  '0 15 * * 2'
jobs:
  update-deps:
    name: Update Node dependencies
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v2
      - uses: stephankaag/gh-action-node-update-deps@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          bump-version: patch     # defaults to not bumping the package version
          package-manager: yarn   # defaults to 'npm'
```
