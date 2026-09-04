# homebrew-tap

Homebrew formulae for [ChildishForces](https://github.com/ChildishForces)
projects.

## Install

```sh
brew install childishforces/tap/jst
```

## Formulae

| Formula | Description                                                    |
| ------- | -------------------------------------------------------------- |
| `jst`   | Convert JSON Schema to Zod, TypeScript, Pydantic, Swift, and Kotlin |

## Updating

`Formula/jst.rb` is updated automatically: each tagged release of
[json-schema-transformer](https://github.com/ChildishForces/json-schema-transformer)
renders the formula (version + sha256 filled in) and its Release workflow
pushes it here. If the automation is ever unavailable, the same rendered
`jst.rb` is attached to the GitHub Release — copy it over `Formula/jst.rb`
and push.
